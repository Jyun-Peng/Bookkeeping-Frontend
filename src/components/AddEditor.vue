<script setup>
    const props = defineProps(['on', 'groups'])
    const emit = defineEmits(['close']);

    const amount = useState('amount', () => '');
    const groupId = useState('groupId', () => null);
    const bookId = useState('bookId', () => null);

    const books = computed(() => {
        const group = props.groups.find(item => item.id === groupId.value);
        
        if(typeof group === 'undefined') return [];

        return group.books;
    });

    watch(() => props.on, value => value && init()); // clear selections when open
    watch(groupId, () => bookId.value = null); // clear book selection when selected group changed

    function init() {
        amount.value = '';
        groupId.value = '';
        bookId.value = '';
    }

    function add() {
        const amountValue =  Number(amount.value);
        const groupIdValue = groupId.value;
        const bookIdValue = bookId.value;

        // Submit new record

        close();
    }

    function close() {
        emit('update:on', false);
    }

    init();
</script>

<template>
    <v-overlay class="d-flex justify-center align-center" v-model="props.on" persistent>
        <div class="editor">
            <h3>新增</h3>
            <v-text-field type="number" density="compact" v-model="amount"></v-text-field>
            <v-select v-model="groupId" :items="props.groups" item-title="name" item-value="id" density="compact"></v-select>
            <v-select v-model="bookId" :items="books" item-title="name" item-value="id" density="compact"></v-select>
            <div class="d-flex justify-space-between">
                <v-btn @click="close">X</v-btn>
                <v-btn @click="add">+</v-btn>
            </div>
        </div>
    </v-overlay>
</template>

<style>
.editor {
    background-color: rgb(var(--v-theme-white));
}
</style>