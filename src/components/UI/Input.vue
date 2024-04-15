<template>
  <input
    :type="type"
    autocomplete="off"
    :name="name"
    class="input"
    :placeholder="placeholder"
  />
</template>

<script>
export default {
  name: "InputVue",
  props: {
    placeholder: String,
    name: String,
    type: String,
  },
};
</script>

<style lang="scss" scoped>
input {
  background-color: #05060f0a;
  max-width: 190px;
  height: 44px;
  border-radius: 0.5rem;
  padding: 0 1rem;
  border: 2px solid transparent;

  :hover,
  :focus,
  input-group:hover input {
    outline: none;
    border-color: #05060f;
  }

  input-group:hover,
  :focus {
    color: #05060fc2;
  }
}
input[type="text"] {
  font-size: 1rem;
  transition: border-color 0.3s cubic-bezier(0.25, 0.01, 0.25, 1) 0s,
    color 0.3s cubic-bezier(0.25, 0.01, 0.25, 1) 0s,
    background 0.2s cubic-bezier(0.25, 0.01, 0.25, 1) 0s;
}

input[type="date"] {
  font-size: 18px;
}
::-webkit-calendar-picker-indicator {
  background-color: #ffffff;
  padding: 5px;
  cursor: pointer;
  border-radius: 3px;
}
</style>
