#!/usr/bin/env node

const path = require("path");
const fs = require("fs");

const home = process.env.HOME;

const destFile = home + "/.zsh_history";

// process.argv: [node path, file path, arg[0] ]
const syncFile = process.argv[2];

const readFile = (path) => {
  return new Promise((resolve, reject) => {
    if (!fs.existsSync(path)) {
      console.warn(path + " isn't exists, creating...");
      fs.writeFileSync(path, "");
    }
    fs.readFile(path, "utf8", (err, data) => {
      if (err) {
        console.error(err);
        reject(err);
      }
      resolve(
        data
          .split("\n: ")
          .filter((command) => command && command.length)
          .map((command) => {
            command = command.replace(/(\\| )$/gim, "");
            if (command.slice(0, 2) !== ": ") {
              return ": " + command + "\n";
            }
            return command + "\n";
          })
      );
    });
  });
};

const writeFile = (path, content) => {
  return new Promise((resolve, reject) => {
    fs.writeFile(path, content, "utf8", (err) => {
      if (err) {
        reject(err);
      } else {
        resolve(content);
      }
    });
  });
};

const onlyUnique = (value, index, self) => self.indexOf(value) === index;

Promise.all([readFile(home + "/.zsh_history"), readFile(syncFile)]).then(
  (values) => {
    let sourceItems = values[0];
    let newItems = values[1];
    let items = [];
    Array.prototype.push.apply(items, sourceItems);
    Array.prototype.push.apply(items, newItems);
    items = items.filter(onlyUnique).sort();

    let newContent = items.join("");
    writeFile(destFile, newContent).then(() => {
      writeFile(syncFile, newContent);
      console.log(
        `\n======== Start ${new Date().toLocaleDateString()} ${new Date().toLocaleTimeString()} ========`
      );
      console.log(
        "merge succeed! \nexisted commands " +
          sourceItems.length +
          "\nnew commands " +
          newItems.length +
          "\nduplicated " +
          (sourceItems.length + newItems.length - items.length) +
          "\ntotal " +
          items.length
      );
      console.log("======== End ========");
    });
  }
);
