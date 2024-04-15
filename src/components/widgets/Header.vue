<template>
  <header class="header">
    <img src="@/assets/logo.png" alt="logo" class="header__logo" />
    <div class="header__actions">
      <HeaderBtn
        class="actions__btn"
        title="РЕГИСТРАЦИЯ"
        @click.native="$emit('showRegisterModal')"
      />
    </div>
  </header>
</template>

<script>
import HeaderBtn from "../UI/HeaderBtn.vue";
export default {
  name: "HeaderVue",
  components: {
    HeaderBtn,
  },
  emits: ["showRegisterModal"],
};
</script>

<style scoped lang="scss">
.header {
  position: relative;
  top: 0;
  width: 100svw;
  padding: 1rem;
  display: flex;
  align-items: center;
  justify-content: space-between;
  background-color: rgb(11, 14, 19);
}

.header__logo {
  width: 60px;
  height: 60px;
}

.header__actions {
  margin-right: 30px;
  :first-child {
    margin-right: 10px;
  }
}

.actions__btn {
  background-color: #000000;
  border: 2px solid #1a1a1a;
  border-radius: 15px;
  color: #ffffff;
  font-size: 16px;
  font-weight: 600;
  min-height: 60px;
  padding: 16px 24px;
  text-align: center;
}

.actions__btn:hover {
  box-shadow: rgba(0, 0, 0, 0.25) 0 8px 15px;
  transform: translateY(-2px);
}

.actions__btn:active {
  box-shadow: none;
  transform: translateY(0);
}

.logo {
  height: 40px;
  width: 40px;
}
</style>
