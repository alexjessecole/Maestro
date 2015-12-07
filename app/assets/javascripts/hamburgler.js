var ready = function() {
          $(".icon").click(function () {
        $(".mobilenav").fadeToggle(500);
        $(".top-menu").toggleClass("top-animate");
        $(".mid-menu").toggleClass("mid-animate");
        $(".bottom-menu").toggleClass("bottom-animate");
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);


