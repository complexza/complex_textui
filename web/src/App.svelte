<script lang="ts">
    import { CONFIG, IS_BROWSER } from './stores/stores';
    import { InitialiseListen } from '@utils/listeners';
    import TextMain from '@components/TextMain.svelte';

    CONFIG.set({
        fallbackResourceName: 'debug',
        allowEscapeKey: false,
    });

    InitialiseListen();
</script>

<TextMain />

{#if import.meta.env.DEV}
    {#if $IS_BROWSER}
        {#await import('./providers/Debug.svelte') then { default: Debug }}
            <Debug />
        {/await}
    {/if}
{/if}
