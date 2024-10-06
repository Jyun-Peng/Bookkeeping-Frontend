<script setup>
    const groups = useState('groups', () => [
        {
            name: "group01",
            id: 1,
            books: [
                {name: 'book01', id: 1},
                {name: 'book02', id: 2}
            ]
        },
        {
            name: "group02",
            id: 2,
            books: [
                {name: 'book03', id: 3},
                {name: 'book04', id: 4}
            ]
        }
    ]);
    
    const isEditorActive = useState('isEditorActive', () => false);
</script>

<template>
    <v-app-bar title="首頁">
        <v-btn @click="isEditorActive = true">新增</v-btn>
    </v-app-bar>
    <AddEditor v-model:on="isEditorActive" :groups="groups"></AddEditor>
</template>