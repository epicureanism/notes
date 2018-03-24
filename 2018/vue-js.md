---
title: vue.js
tags: UI JS
notebook: JS
---

## tips
  - Input 的2 way binding 不是用v-bind, 而是用v-model
```html
<input v-model=“keyword" />
```

## ajax
  - Ajax 呼叫，官方從vue-ressource 改建議 axios
  - 起手式：
```html
<script src=“https://unpkg.com/axios/dist/axios.min.js”></script>
```
```JS
//保留$http 關鍵字成為axios主體
Vue.prototype.$http = axios;
var $apiUrl = "/api/some-resource";
var app = new Vue({
    el: '#app',
    data: {
        list: [{name: "..."}]
    },
    created: some_init_func,
    methods: {
        //ajax 呼叫
        some_init_func: function(){
            //this 指向vue 的全堿
            var self = this;
            this.$http.get($apiUrl, {
                params: { keyword: "hi" }
            })
            .then(function(response){
                self.list = response.data;
            })
            .catch(function(error){
                console.log(error);
            });
        }
    }
})
```