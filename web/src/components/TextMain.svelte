<script lang="ts">
    import { Receive } from '@enums/events';
    import { ReceiveEvent } from '@utils/eventsHandlers';
    import { fly } from 'svelte/transition';
    import { textUI } from '@stores/stores';;

    let positionClasses = {
        'top-left': 'top-4 left-4',
        'top-middle': 'top-4 left-1/2 transform -translate-x-1/2',
        'top-right': 'top-4 right-4',
        'middle-left': 'top-1/2 left-4 transform -translate-y-1/2',
        'middle-middle': 'top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2',
        'middle-right': 'top-1/2 right-4 transform -translate-y-1/2',
        'bottom-left': 'bottom-4 left-4',
        'bottom-middle': 'bottom-4 left-1/2 transform -translate-x-1/2',
        'bottom-right': 'bottom-4 right-4'
    };

    let transitionOffsets = {
        'top-left': { x: 0, y: -100 },
        'top-middle': { x: 0, y: -100 },
        'top-right': { x: 0, y: 100 },
        'middle-left': { x: -100, y: 0 },
        'middle-middle': { x: 0, y: 0 },
        'middle-right': { x: 100, y: 0 },
        'bottom-left': { x: 100, y: 0 },
        'bottom-middle': { x: 0, y: -100 },
        'bottom-right': { x: -1000, y: 0 }
    };

    ReceiveEvent(Receive.changeText, (newText: string) => {
        textUI.update(state => ({
            ...state,
            text: newText
        }));
    });

    ReceiveEvent(Receive.changeKeybind, (newKeybind: string) => {
        textUI.update(state => ({
            ...state,
            keybind: newKeybind
        }));
    });

    ReceiveEvent(Receive.showTextUI, (data: any) => {
        textUI.set({
            SHOWTEXTUI: true,
            text: data.text,
            keybind: data.keybind,
            position: data.position
        });
    });

    ReceiveEvent(Receive.hideTextUI, () => {
        textUI.set({
            SHOWTEXTUI: false,
            text: '',
            keybind: '',
            position: 'bottom-left'
        });
    });

    let transition = transitionOffsets[$textUI.position] || { x: -100, y: 0 };
</script>

{#if $textUI.SHOWTEXTUI}
    <div class="w-screen h-screen absolute top-0 left-0">
        <div class={`absolute ${positionClasses[$textUI.position]} flex items-center space-x-2`} 
            transition:fly={{ x: transition.x, y: transition.y, duration: 500 }}>
            
            {#if $textUI.keybind !== ''}
                <span class="relative bg-accent p-10 flex items-center justify-center rounded-md">
                    <span class="bg-green-500 bg-opacity-20 w-[75%] h-[75%] absolute rounded-lg flex items-center justify-center text-green-500 border-green-500 border-2 font-bold" 
                        style="text-shadow: 0 0 5px #50bcaf40, 0 0 5px #50bcaf40, 0 0 1px #50bcaf40, 0 0 5px #50bcaf40; box-shadow: 0 0 1px #43b8a5, 0 0 6px #43b8a5;">
                        {$textUI.keybind}
                    </span>
                </span>
            {/if}

            <span class="relative bg-accent p-4 flex items-center h-20 rounded-md text-white">
                <span class="absolute top-2 left-2 w-2 h-2 bg-green-500 rounded-full" style="box-shadow: 0 0 10px #43b8a5, 0 0 20px #43b8a5;"/>
                {$textUI.text}
            </span>
        </div>
    </div>
{/if}


