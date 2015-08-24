<%-- _lcid="1033" _version="16.0.4316" _dal="1" --%>
<%-- _LocalBinding --%>
<%@ Page language="C#" %>
<!DOCTYPE html>
<html id="html">
  <head id="head">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="google" value="notranslate" />

  	<style>

      /* CSS Customization */

      .backdropImageAlternate, .backdrop {
          background-image:url('https://i.imgur.com/uxnU0XP.jpg') !important
      }

  	</style>

    <script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.11.1.js"></script>

    <script>

        var g_wsaEnabled = false;
        jQuery.noConflict();

        // Wait Until Exists plugin
        (function(e,f){var b={},g=function(a){b[a]&&(f.clearInterval(b[a]),b[a]=null)};e.fn.waitUntilExists=function(a,h,j){var c=this.selector,d=e(c),k=d.not(function(){return e(this).data("waitUntilExists.found")});"remove"===a?g(c):(k.each(a).data("waitUntilExists.found",!0),h&&d.length?g(c):j||(b[c]=f.setInterval(function(){d.waitUntilExists(a,h,!0)},500)));return d}})(jQuery,window);


    </script>
    <link rel="shortcut icon" href="/_layouts/15/images/ME.ico?rev=40" type="image/vnd.microsoft.icon" id="favicon" />
    <title>Delve</title>

  </head>
  <body style="margin: 0px" id="body">

        <div id="shellTop"></div>
        <div id="pulseRoot"></div>
        <div id="shellBottom"></div>

        <div id="preCultureFlushScripts"></div>
        <div id="flushingContainer"></div>
        <div id="postCultureFlushScripts"></div>

        <div id="configScript"></div>
        <div id="availabilityContainer"></div>
        <div id="availabilityFlushScripts"></div>

        <script>
        jQuery.ajaxSetup({ cache: true });

        jQuery.ajax({
          url: "/_layouts/15/me.aspx",
          success: function(r) {
            var div = jQuery('<div>');
            div.html(r);

            var preScripts1 = div.find("#preCultureFlushScripts > script").eq(0).attr("src");
            var preScripts2 = div.find("#preCultureFlushScripts > script").eq(1).attr("src");
            var postScripts = div.find("#postCultureFlushScripts > script").eq(0).attr("src");
            var configScript = div.find("#configScript > script").eq(0).html();
            var postConfigScript = div.find("#configScript").next().html();
            var availabilityFlushScripts = div.find("#availabilityFlushScripts > script").eq(0).html()

            jQuery.getScript(preScripts1, function() {
              jQuery.getScript(preScripts2, function() {
                jQuery.getScript(postScripts, function() {

                    eval(configScript)
                    eval(postConfigScript)
                    eval(availabilityFlushScripts)

                    // JS Customization
                    jQuery("#ContactModule").waitUntilExists(function() {
                      jQuery("#ContactModule > h3 > .UserProperty-title").text("My Info")
                    });

                })
              })
            })
          }
        })

        </script>

    </body>
</html>
