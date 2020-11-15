function JsAlert() {
  var $scope = $('.js-alert');
  var removeAlert = function() {
    $scope.remove();
  };

  $scope.on('click', function() {
    removeAlert();
  });

  setTimeout(removeAlert, 5000);
};

function JsCopy(button, source, target) {
  var $button = $(button);
  var $source = $(source);
  var $target = $(target);

  $button.on('click', function() {
    $target.val($source.html());
  });
}

$(document).ready(function () {
  new JsAlert();
  new JsCopy('.js-copy-button-1', '.js-copy-source-1', '.js-copy-target-1');
  new JsCopy('.js-copy-button-2', '.js-copy-source-2', '.js-copy-target-2');
});
