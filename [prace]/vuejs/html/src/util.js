export default {
  async sendNUI(event, data = {}) {
    // return await new Promise(resolve => setTimeout(resolve, 100));
    return await fetch(`https://vuejs/${event}`, {
      method: 'post',
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: JSON.stringify(data),
    });
  },
};