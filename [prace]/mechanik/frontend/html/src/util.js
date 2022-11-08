export default {
    async sendNUI(event, data = {}) {
        return await fetch(`https://mechanik/${event}`, {
            method: 'post',
            headers: {
                'Content-type': 'application/json; charset=UTF-8',
                'mode': 'no-cors'
            },
            body: JSON.stringify(data),
        });
    },

    emulate(type, data = null) {
        window.dispatchEvent(
            new MessageEvent('message', {
                data: {
                    type,
                    data,
                },
            }),
        );
    },
};