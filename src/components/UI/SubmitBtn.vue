<template>
  <input type="submit" :value="text" />
</template>

<script>
export default {
  props: {
    text: String,
  },
};
</script>

<style lang="scss" scoped>
input {
  padding: 15px 40px;
  background: #000;
  border: 0;
  color: #fff;
  text-transform: uppercase;
  font-family: helvetica;
  font-size: 12px;
  letter-spacing: 3px;
  position: relative;
  transition: all 0.4s cubic-bezier(0.645, 0.045, 0.355, 1);
  cursor: pointer;
  display: block;
  border-top-left-radius: 80px 80px;
  border-top-right-radius: 80px 80px;
}

input::after,
input::before {
  content: "";
  position: absolute;
  top: 50%;
  right: 0px;
  transform: translateY(-50%);
  opacity: 0;
  transition: all 0.4s cubic-bezier(0.645, 0.045, 0.355, 1);
}

input::after {
  width: 30px;
  height: 1px;
  background: white;
  transform: translateX(-3px);
  margin-top: 0px;
}

input::before {
  content: "";
  transform: rotate(-135deg) translateX(50%);
  width: 11px;
  height: 11px;
  background: transparent;
  border-left: 1px solid white;
  border-bottom: 1px solid white;
  margin-top: -1px;
}

input:hover {
  padding: 15px 60px 15px 20px;
}

input:hover::after,
input:hover::before {
  opacity: 1;
  right: 15px;
}
</style>
