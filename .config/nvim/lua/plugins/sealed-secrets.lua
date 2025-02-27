return {
  "tinoschroeter/sealed-secrets.nvim",
  -- dir = "~/privat/sealed-secrets.nvim",
  config = function()
    require("sealed-secrets").setup({
      cert_path = "../../../sealedsecrets.pem",
    })
  end,
}
