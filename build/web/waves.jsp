<%-- 
    Document   : waves
    Created on : May 7, 2023, 12:01:06 PM
    Author     : twin_n
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/0.152.2/three.min.js" integrity="sha512-R7eFJsc3NlvsTn5hdD/Xvi6FwpFGAoGOa2nBNU89DXAZzXgQQrfhgHVpm5Kh7H9EuCU3Ymexph9z4IiHrq977g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/vanta@0.5.24/dist/vanta.waves.min.js" > </script>


<div id="waves" ></div>

<script>
    VANTA.WAVES({
      el: "#waves",
      mouseControls: true,
      touchControls: true,
      gyroControls: false,
      minHeight: 200.00,
      minWidth: 200.00,
      scale: 1.00,
      scaleMobile: 1.00,
      color: 0x6a8396,
      shininess: 12.00,
      waveHeight: 21.50,
      waveSpeed: 0.50,
      zoom: 1.43
    })
</script>

<style>
    
    #waves {
        z-index: -1;
        position: absolute;
        top: 0;
        left: 0;
        width: 100vw;
        height: 100vh;
    }
</style>
