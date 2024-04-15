<template>
  <div id="app">
    <Header @showRegisterModal="registerModal = true" />
    <Main />
    <Footer />
    <register-modal v-if="registerModal" @close="closeRegisterModal" />
    <Transition>
      <succes-modal v-if="succesModal" :title="'Регистрация прошла успешно'" />
    </Transition>
  </div>
</template>

<script>
import Vue from "vue";
import Header from "./components/widgets/Header.vue";
import Main from "./components/Main.vue";
import Footer from "./components/widgets/Footer.vue";
import RegisterModal from "./components/RegisterModal.vue";
import SuccesModal from "./components/UI/SuccesModal.vue";

export default Vue.extend({
  name: "App",
  data() {
    return {
      registerModal: false,
      succesModal: false,
    };
  },
  components: {
    Header,
    Main,
    Footer,
    RegisterModal,
    SuccesModal,
  },
  methods: {
    closeRegisterModal(succes) {
      this.registerModal = false;
      if (succes) {
        this.succesModal = true;
        setTimeout(() => {
          this.succesModal = false;
        }, 5000);
      }
    },
  },
});
</script>

<style lang="scss">
* {
  box-sizing: border-box;
}
#app {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  min-width: 100svw;
  min-height: 100svh;
  margin: 0 auto;
  font-weight: normal;
}
body {
  margin: 0;
  background-color: rgb(17 24 39);
}
.v-enter-active,
.v-leave-active {
  transition: opacity 1.5s ease;
}

.v-enter-from,
.v-leave-to {
  opacity: 0;
}
</style>
