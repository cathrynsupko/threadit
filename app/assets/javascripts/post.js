$(document).ready(function(){
    $('#sign-up-link').click(function(){
        $('#in').slideUp(300);
        $('#up').slideDown(500);
    });
    
    $('#sign-in-link').click(function(){
        $('#up').slideUp(300);
        $('#in').slideDown(500);
    });
    
    $('#popular-link').click(function(){
        $('.tab').removeClass('active');
        $('#popular').addClass('active'); 
    });
    
    $('#recent-link').click(function(){
        $('.tab').removeClass('active');
        $('#recent').addClass('active');
    });
    
    $('.reply-link').on('click', function(){
        $(this).next().toggle();
    });
   
});

