<!--
 * @Description: 
 * @Author: Lana
 * @Date: 2021-02-18 15:44:51
 * @LastEditTime: 2021-02-20 15:13:23
 * @LastEditors: Lana
-->
<template>
  <div>
    <div>{{ count }}</div>
    <input type="text" v-model="name" />
    <button @click="increment">count++</button>
    <button @click="linkCache">跳转缓存页</button>
  </div>
</template>

<script>
import { reactive, ref, watch } from "vue";

export default {
  setup(props, context) {
    console.log("setup");
    console.log(props);
    let count = reactive({
      num: 0,
    });
    const name = ref(null);
    console.log(name);
    name.value = "hh";
    const increment = () => count.num++;
    const linkCache = () => {
      console.log(context);
    };
    watch(name, (oldname, newname) => {
      console.log(newname);
    });
    return {
      count,
      name,
      increment,
      linkCache,
    };
  },
  beforeCreate() {
    console.log("beforeCreate");
  },
  created() {
    console.log("created");
  },
};
</script>
