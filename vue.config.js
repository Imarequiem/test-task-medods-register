const { defineConfig } = require("@vue/cli-service");
module.exports = defineConfig({
  transpileDependencies: true,
  // eslint-disable-next-line prettier/prettier
  publicPath: process.env.NODE_ENV === "production"
      ? "/medods-testTask-registerForm/"
      : "/",
});
