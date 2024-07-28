import { DebugItem } from '@typings/events'
import { toggleVisible } from './visibility'
import { Send } from '@enums/events'
import { DebugEventSend, SendEvent } from '@utils/eventsHandlers'

const positions = [
    'top-left',
    'top-middle',
    'top-right',
    'middle-left',
    'middle-middle',
    'middle-right',
    'bottom-left',
    'bottom-middle',
    'bottom-right'
];

const SendDebuggers: DebugItem[] = [
    {
        label: 'Visibility',
        actions: [
            {
                label: 'True',
                action: () => toggleVisible(true),
            },
            {
                label: 'False',
                action: () => toggleVisible(false),
            },
        ],
    },
    {
        label: 'Change Text',
        actions: [
            {
                label: 'Type',
                action: (value: string) =>
                    DebugEventSend(Send.changeText, value),
                type: 'text',
                placeholder: 'Type here',
            },
        ],
    },
    {
        label: 'Change Keybind',
        actions: [
            {
                label: 'Type',
                action: (value: string) =>
                    DebugEventSend(Send.changeKeybind, value),
                type: 'text',
                placeholder: 'Type here',
            },
        ],
    },
    {
        label: 'Show Text UI',
        actions: [
            {
                label: 'Set',
                action: () => {
                    const text = prompt('Enter text:', 'Default text');
                    const keybind = prompt('Enter keybind:', 'Default keybind');
                    const position = prompt('Enter position (e.g., top-left, top-middle, bottom-right):', 'bottom-left');

                    DebugEventSend(Send.showTextUI, {
                        text: text || '',
                        keybind: keybind || '',
                        position: position || 'bottom-left'
                    });
                },
                type: 'button',
                placeholder: '',
            },
        ],
    },
    {
        label: 'Hide Text UI',
        actions: [
            {
                label: 'Hide',
                action: () => DebugEventSend(Send.hideTextUI, {}),
                type: 'button',
                placeholder: '',
            },
        ],
    },
    {
        label: 'Random Position',
        actions: [
            {
                label: 'Randomize',
                action: () => {
                    const randomPosition = positions[Math.floor(Math.random() * positions.length)];
                    DebugEventSend(Send.showTextUI, {
                        text: 'Example Text',
                        keybind: 'E',
                        position: randomPosition
                    });
                },
                type: 'button',
                placeholder: '',
            },
        ],
    }
];

export default SendDebuggers
