<template>
  <div class="modal" @click.self="$emit('close')">
    <div class="modal__register">
      <button class="close-form" @click="$emit('close')">&#215;</button>

      <form action="" @submit.prevent="toSubmit">
        <section class="personal">
          <label for=""
            >Имя <span class="span-require">(обязательно)</span></label
          >
          <div class="personal__input-div">
            <input
              class="input"
              :class="$v.form.firstName.$error ? 'invalid-input' : ''"
              v-model.trim="form.firstName"
              placeholder="Имя"
              type="text"
              name="Имя"
              autocomplete="off"
            />
            <span
              class="text-danger"
              v-if="!$v.form.firstName.required && $v.form.firstName.$dirty"
            >
              Имя обязательно
            </span>
          </div>

          <label for=""
            >Фамилия <span class="span-require">(обязательно)</span></label
          >
          <div class="personal__input-div">
            <input
              class="input"
              :class="$v.form.lastName.$error ? 'invalid-input' : ''"
              v-model.trim="form.lastName"
              placeholder="Фамилия"
              type="text"
              name="Фамилия"
              autocomplete="off"
            />
            <span
              class="text-danger"
              v-if="!$v.form.lastName.required && $v.form.lastName.$dirty"
            >
              Фамилия обязательна
            </span>
          </div>

          <label for="">Отчество</label>
          <div class="personal__input-div">
            <input
              class="input"
              v-model.trim="form.patronymic"
              placeholder="Отчество"
              type="text"
              name="Отчество"
              autocomplete="off"
            />
          </div>

          <label for=""
            >Дата рождения
            <span class="span-require">(обязательно)</span></label
          >
          <div class="personal__input-div">
            <input
              class="input"
              :class="$v.form.birthday.$error ? 'invalid-input' : ''"
              v-model="form.birthday"
              placeholder="Дата рождения"
              type="date"
              name="Дата рождения"
              autocomplete="off"
            />
            <span
              class="text-danger"
              v-if="!$v.form.birthday.required && $v.form.birthday.$dirty"
            >
              Дата рождения обязательна
            </span>
          </div>

          <label for=""
            >Номер телефона
            <span class="span-require">(обязательно)</span></label
          >
          <div class="personal__input-div">
            <input
              class="input"
              :class="$v.form.phone.$error ? 'invalid-input' : ''"
              v-model="form.phone"
              placeholder="Номер телефона"
              type="text"
              name="Номер телефона"
              autocomplete="off"
            />
            <span
              class="text-danger"
              v-if="!$v.form.phone.required && $v.form.phone.$dirty"
            >
              Номер телефона обязателен
            </span>
            <span
              class="text-danger"
              v-if="!$v.form.phone.phone && $v.form.phone.$dirty"
            >
              Некорректный номер телефона
            </span>
          </div>

          <label for=""
            >Ваш пол <span class="span-require">(обязательно)</span></label
          >
          <div class="personal__input-div">
            <select
              name="Пол"
              v-model="form.gender"
              class="input"
              :class="$v.form.gender.$error ? 'invalid-input' : ''"
            >
              <option v-bind:value="'Мужской'">Мужской</option>
              <option v-bind:value="'Женский'">Женский</option>
            </select>
            <span
              class="text-danger"
              v-if="!$v.form.gender.required && $v.form.gender.$dirty"
            >
              Ваш пол обязателен
            </span>
          </div>

          <label for="">
            Ваша группа <span class="span-require">(обязательно)</span>
            <br />
            <small> CMD(MacOS) или CTRL(Windows) + клик </small>
          </label>
          <div class="personal__input-div">
            <select
              v-model="form.group"
              multiple
              class="multiple"
              :class="$v.form.group.$error ? 'invalid-input' : ''"
            >
              <option v-for="groupItem of groupList" :key="groupItem">
                {{ groupItem }}
              </option>
            </select>
            <span
              class="text-danger"
              v-if="!$v.form.group.required && $v.form.group.$dirty"
            >
              Ваша группа обязательна
            </span>
          </div>

          <label for=""
            >Лечащий доктор
            <span class="span-require">(обязательно)</span></label
          >
          <div class="personal__input-div">
            <select
              class="input"
              :class="$v.form.doctor.$error ? 'invalid-input' : ''"
              v-model="form.doctor"
            >
              <option v-for="doctorItem of doctorList" :key="doctorItem">
                {{ doctorItem }}
              </option>
            </select>
            <span
              class="text-danger"
              v-if="!$v.form.doctor.required && $v.form.doctor.$dirty"
            >
              Ваш лечащий врач обязателен
            </span>
          </div>
        </section>

        <section class="adress">
          <label for="">Индекс</label>
          <div class="personal__input-div">
            <input
              class="input"
              v-model.trim="form.index"
              placeholder="Индекс"
              type="text"
              name="Индекс"
              autocomplete="off"
            />
          </div>

          <label for="">Страна</label>
          <div class="personal__input-div">
            <input
              class="input"
              v-model.trim="form.country"
              placeholder="Страна"
              type="text"
              name="Страна"
              autocomplete="off"
            />
          </div>

          <label for="">Область</label>
          <div class="personal__input-div">
            <input
              class="input"
              v-model.trim="form.region"
              placeholder="Область"
              type="text"
              name="Область"
              autocomplete="off"
            />
          </div>

          <label for=""
            >Город <span class="span-require">(обязательно)</span></label
          >
          <div class="personal__input-div">
            <input
              class="input"
              :class="$v.form.city.$error ? 'invalid-input' : ''"
              v-model.trim="form.city"
              placeholder="Город"
              type="text"
              name="Город"
              autocomplete="off"
            />
            <span
              class="text-danger"
              v-if="!$v.form.city.required && $v.form.city.$dirty"
            >
              Город обязателен
            </span>
          </div>

          <label for="">Улица</label>
          <div class="personal__input-div">
            <input
              class="input"
              v-model.trim="form.street"
              placeholder="Улица"
              type="text"
              name="Улица"
              autocomplete="off"
            />
          </div>

          <label for="">Дом</label>
          <div class="personal__input-div">
            <input
              class="input"
              v-model.trim.number="form.house"
              placeholder="Дом"
              type="number"
              name="Дом"
              autocomplete="off"
            />
          </div>
        </section>

        <section class="passport">
          <label for=""
            >Тип документа
            <span class="span-require">(обязательно)</span></label
          >
          <div class="personal__input-div">
            <select
              name="Документ"
              v-model="form.docType"
              class="input"
              :class="$v.form.docType.$error ? 'invalid-input' : ''"
            >
              <option v-for="docItem in docItems" :key="docItem">
                {{ docItem }}
              </option>
            </select>
            <span
              class="text-danger"
              v-if="!$v.form.docType.required && $v.form.docType.$dirty"
            >
              Тип документа обязателен
            </span>
          </div>

          <label for="">Серия документа</label>
          <div class="personal__input-div">
            <input
              class="input"
              v-model.trim="form.docSeries"
              placeholder="Серия документа"
              type="text"
              name="Серия документа"
            />
          </div>

          <label for="">Номер документа</label>
          <div class="personal__input-div">
            <input
              class="input"
              v-model.trim.number="form.docNumber"
              placeholder="Номер документа"
              type="text"
              name="Номер документа"
            />
          </div>

          <label for="">Кем выдан</label>
          <div class="personal__input-div">
            <input
              class="input"
              v-model.trim="form.docIssued"
              placeholder="Кем выдан"
              type="text"
              name="Кем выдан"
            />
          </div>

          <label for=""
            >Дата выдачи <span class="span-require">(обязательно)</span></label
          >
          <div class="personal__input-div">
            <input
              class="input"
              :class="$v.form.issueDate.$error ? 'invalid-input' : ''"
              v-model.trim="form.issueDate"
              placeholder="Дата выдачи"
              type="text"
              name="Дата выдачи"
            />
            <span
              class="text-danger"
              v-if="!$v.form.issueDate.required && $v.form.issueDate.$dirty"
            >
              Дата выдачи обязательна
            </span>
          </div>
        </section>

        <section class="checkboxs-section">
          <input
            type="checkbox"
            v-model="sms"
            @click="sms = !sms"
            id="sms-checkbox"
          />
          <label id="label-sms" for="sms-checkbox">Не отправлять смс</label>
        </section>
        <SubmitBtn :text="'Зарегистрироваться'" class="submit-btn" />
      </form>
    </div>
  </div>
</template>

<script>
import SubmitBtn from "./UI/SubmitBtn.vue";

import { required, helpers } from "vuelidate/lib/validators";

const phone = helpers.regex(
  "serial",
  // eslint-disable-next-line no-useless-escape
  /^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/
);

export default {
  data() {
    return {
      form: {
        firstName: "",
        lastName: "",
        patronymic: "",
        birthday: "",
        phone: "",
        gender: "",
        group: [],
        doctor: "",
        index: "",
        country: "",
        region: "",
        city: "",
        street: "",
        house: null,
        docType: "",
        docSeries: null,
        docNumber: null,
        docIssued: "",
        issueDate: "",
      },
      sms: false,
      groupList: ["VIP", "Проблемные", "ОМС"],
      doctorList: ["Иванов", "Захаров", "Чернышева"],
      docItems: ["Паспорт", "Свидетельство о рождении", "Вод. удостоверение"],
    };
  },
  components: {
    SubmitBtn,
  },
  emits: ["close"],
  validations() {
    return {
      form: {
        firstName: { required },
        lastName: { required },
        birthday: {
          required,
        },
        phone: {
          required,
          phone,
        },
        group: { required },
        doctor: { required },
        gender: { required },
        city: { required },
        docType: { required },
        issueDate: { required },
      },
    };
  },
  methods: {
    toSubmit() {
      this.$v.$touch();

      if (!this.$v.form.$error) {
        this.$emit("close", true);
      }
    },
  },
};
</script>

<style scoped lang="scss">
@import url("https://fonts.googleapis.com/css2?family=Oswald:wght@200..700&display=swap");
@import url("https://fonts.googleapis.com/css2?family=Oswald:wght@200&family=Roboto+Mono:ital,wght@0,100..700;1,100..700&display=swap");
.modal {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background-color: rgba(0, 0, 0, 0.355);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 0;
}
.modal__register {
  border-radius: 25px;
  background-color: rgba(#ffffff, 1);
  height: 80%;
  width: 50%;
  z-index: 10;
  overflow-y: scroll;
  -ms-overflow-style: none;
  scrollbar-width: none;
  .modal__register::-webkit-scrollbar {
    width: 0;
    height: 0;
  }
}
form {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-between;
  padding: 25px 0 25px 25px;
  height: 100%;
}
section {
  flex-direction: column;
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  align-items: baseline;
  width: 500px;
  justify-items: stretch;
}

.input {
  height: 44px;
  margin-left: 10px;
}
.input,
label {
  margin-top: 10px;
}
label,
input,
.input {
  font-family: "Roboto Mono", monospace;
  font-optical-sizing: auto;
  font-weight: 400;
  font-style: normal;
}
.input,
select {
  background-color: #05060f0a;
  width: 190px;
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
input[type="text"],
select {
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
.multiple {
  padding-top: 20px;
  margin: 10px 0 0 10px;
}
.submit-btn {
  box-shadow: 1px 0px 45px -5px rgba(0, 0, 0, 0.75);
  -webkit-box-shadow: 1px 0px 45px -5px rgba(0, 0, 0, 0.75);
  -moz-box-shadow: 1px 0px 45px -5px rgba(0, 0, 0, 0.75);
  margin-top: 50px;
  position: relative;
  top: 3px;
}
.personal__input-div {
  margin-top: 10px;
  display: flex;
  flex-direction: column;
  align-items: flex-end;
}
.span-require {
  text-decoration: underline;
}
.text-danger {
  padding-top: 3px;
  font-family: "Oswald", sans-serif;
  font-optical-sizing: auto;
  font-weight: 300;
  font-style: normal;
  color: rgb(185 28 28);
}
#sms-checkbox {
  float: left;
}
#label-sms {
  margin-left: 10px;
  font-family: "Oswald", sans-serif;
  font-optical-sizing: auto;
  font-weight: 400;
  font-style: normal;
}
.checkboxs-section {
  display: flex;
  flex-direction: row;
  justify-content: center;
  margin-top: 40px;
}
small {
  word-wrap: break-word;
}
.invalid-input {
  border-color: rgb(220 38 38);
}
.close-form {
  position: relative;
  float: right;
  top: 7px;
  right: 10px;
  background: transparent;
  color: red;
  border: none;
  font-size: xx-large;
}
@media (max-width: 1050px) {
  .input,
  select {
    width: 150px;
  }
  section {
    width: 350px;
  }
}
@media (max-width: 750px) {
  form {
    padding: 0;
  }
  section {
    grid-template-columns: repeat(1, 1fr);
    justify-items: center;
  }
  .input,
  select {
    width: 220px;
  }
  .modal__register {
    width: 90%;
  }
  label {
    margin-top: 40px;
  }
  label {
    display: flex;
    flex-direction: column;
    align-items: center;
    .span-require {
      display: block;
    }
  }
  .personal__input-div {
    align-items: center;
  }
}
@media (max-width: 700px) {
  label > small {
    width: 95px;
  }
}
@media (max-width: 450px) {
  .input {
    width: 170px;
  }
}
</style>
