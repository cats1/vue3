<template>
  <div>
    <div>{{ count }}</div>
    <button @click="increment">count++</button>
  </div>
</template>

<script>
import { reactive } from "vue";

export default {
  setup() {
    let count = reactive({
      num: 0,
    });

    const increment = () => count.num++;

    return {
      count,
      increment,
    };
  },
};
</script>
