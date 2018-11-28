window.usd.ratesFetcher = ratesFetcherService();

function ratesFetcherService() {
  var vm = {};

  vm.initFetcher = initFetcher;

  return vm;
  
  function initFetcher() {
    var cableObj = ActionCable.createConsumer('ws://localhost:3000/cable');
    cableObj.subscriptions.create({
      channel: 'RatesChannel',
    }, {
      connected: function () {
        // console.log('--- connected ---');
      },

      disconnected: function () {
        // console.log('--- disconnected ---');
      },

      received: function (resp) {
        // console.log('--- received ---');
        // console.log(resp);
        $('#currentValue').text(resp['value']);
      }
    });
  };
};
