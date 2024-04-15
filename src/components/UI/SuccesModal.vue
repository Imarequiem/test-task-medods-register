<template>
  <label>
    <input type="checkbox" class="alertCheckbox" autocomplete="off" />
    <div class="alert success">
      <span class="alertClose">&times;</span>
      <span class="alertText">
        <h1>{{ title }}</h1>
        <br class="clear"
      /></span>
    </div>
  </label>
</template>

<script>
export default {
  props: {
    title: String,
    body: String,
  },
};
</script>

<style lang="scss" scoped>
@import url("https://fonts.googleapis.com/css2?family=Oswald&family=Platypi:ital,wght@0,600;1,600&family=Roboto+Mono:ital@0;1&display=swap");
label {
  position: absolute;
  bottom: 0;
  right: 0;
  width: 35rem;
}
h1 {
  margin: 0;
}
.alert {
  position: relative;
  top: 10;
  left: 0;
  padding: 10px;
  margin: 10px;
  border-radius: 5px;
  cursor: hand;
  cursor: pointer;
  font-family: "Platypi", serif;
  font-optical-sizing: auto;
  font-weight: 600;
  font-style: normal;
}

.alertCheckbox {
  display: none;
}

:checked + .alert {
  display: none;
}

.alertText {
  display: table;
  margin-left: 20px;
  text-align: center;
  font-size: 16px;
}

.alertClose {
  position: absolute;
  right: 10px;
  top: 0px;
  font-size: x-large;
}

.clear {
  clear: both;
}
.success {
  background-color: #efe;
  border: 1px solid #ded;
  color: #9a9;
}
</style>
