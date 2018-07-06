// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require_tree .

$(document).ready(function($) {
    $("table").find($(".total-image-text-container[id]")).each(function() {
        $this = this
        console.log($($this))
            // if ($($this).is("#idSelector")) {
            //     var $id = $(this).attr("id")
            //     var $appender = $("#" + $id).parents()[1]
            //     $($(this).parents()[1]).addClass("elevated")
            //     var request = $.ajax({
            //         url: "/genres/" + $id,
            //         method: "GET"
            //     });
            //     request.done(function(definition) {
            //         $($appender).append(definition)
            //     });
            // }
    });
    $(".image-text").click(function() {
        var $this = $(this);
        var $container = $(this).parents()[1]
        var parents = $(this).parents()
        var $id = $this.attr("id")
        if ($($container).hasClass("elevated")) {
            $($container).children()[1].remove();
            $($container).removeClass("elevated")
        } else {
            $($container).addClass("elevated")
            var $appender = $("#" + $id).parents()[1]
            var request = $.ajax({
                url: "/genres/" + $id,
                method: "GET"
            });
            request.done(function(definition) {
                $($appender).append(definition)
            });
        }
    });
    $("#post").click(function() {
        $("table").find($(".image-text")).each(function() {
            var $id = $(this).attr("id")
            var $container = $(this).parents()[1]
            if ($($container).hasClass("elevated")) {
                var request = $.ajax({
                    url: "/genres/" + $id + "/selections",
                    method: "POST"
                })
                request.done(function(selection) {
                    console.log(selection);
                });
            } else {
                if ($($container).is("#idSelector")) {
                    $selID = $container.id
                    sessionStorage.removeItem($id)
                    var request = $.ajax({
                        url: "/genres/" + $id + "/selections/" + $selID,
                        method: "Delete"
                    });
                }
            }
        })
    })
});