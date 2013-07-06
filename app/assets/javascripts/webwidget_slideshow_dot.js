(function(a){
    a.fn.webwidget_slideshow_dot=function(p){
        var p=p||{};

        var m=p&&p.slideshow_time_interval?p.slideshow_time_interval:"2000";
        var q=p&&p.slideshow_window_width?p.slideshow_window_width:"400";
        var r=p&&p.slideshow_window_height?p.slideshow_window_height:"400";
        var sf=p&&p.soldeshow_foreColor?p.soldeshow_foreColor:"#000";
        var stc=p&&p.slideshow_title_color?p.slideshow_title_color:"#17CCCC";
        var d=p&&p.directory?p.directory:"images/";
        q += "px";
        r += "px";
        var v;
        var w=-1;
        var x=a(this);
        var y=x.find("ul:first").children("li").length;
        if(x.find("ul").length==0||x.find("li").length==0){
            x.append("Require content");
            return null
        }
        init();
        play();
        function init(){
            x.find("ul:first").wrap('<div class="slides_box"></div>');
            x.css("width",q).css("height",r);
            x.find(".slides_box").css("width",q).css("height",r);
            x.find("ul:first").width(parseInt(q)*y);
            x.find("ul:first").children("li").css("width",q).css("height",r);
            x.find("ul:first").children("li").children("a").children("img").css("width",q).css("height",r);
            x.find(".slides_box").after('<div class="title_thumb_box"></div>');
            x.find(".title_thumb_box").append('<div class="title_box"></div>');
            x.find(".title_thumb_box").append('<div class="thumb_box"></div>');
            x.find(".thumb_box").append('<span><img src="'+d+'carousel_back_normal.png" alt="previous"  class="thumb_p"/></span>');
            x.find(".title_thumb_box").css("background-color",sf);
            for (i = 0; i <= y-1; i++)
            {
                x.find(".thumb_box").append('<span><img src="'+d+'carousel_circle_normal.png" class="thumb_num" alt="'+i+'" /></span>');
            }
            x.find(".thumb_box").append('<span><img src="'+d+'carousel_next_normal.png" alt="next"  class="thumb_n"/></span>');
            x.find(".thumb_box").children("span").children("img").click(
                function(){
                    switch($(this).attr("class")){
                        case "thumb_p":
                            previous();
                            break;
                        case "thumb_num":
                            if(parseInt($(this).attr("alt")) == 0){
                                w = y -1;
                            }else{
                                w = parseInt($(this).attr("alt")) -1 ;
                            }
                            play();
                            break;
                        case "thumb_n":
                            next();
                            break;
                    }
                }
            )
            x.find(".thumb_box").children("span").children("img").hover(
                function(){
                    switch($(this).attr("class")){
                        case "thumb_p":
                            $(this).attr("src",d+"carousel_back_hoverhit.png");
                            break;
                        case "thumb_num":
                            if(parseInt($(this).attr("alt")) != w){
                                $(this).attr("src",d+"carousel_circle_hoverhit.png");
                            }
                            break;
                        case "thumb_n":
                            $(this).attr("src",d+"carousel_next_hoverhit.png");
                            break;
                    }
                },
                function(){
                    switch($(this).attr("class")){
                        case "thumb_p":
                            $(this).attr("src",d+"carousel_back_normal.png");
                            break;
                        case "thumb_num":
                            if(parseInt($(this).attr("alt")) != w){
                                $(this).attr("src",d+"carousel_circle_normal.png");
                            }
                            break;
                        case "thumb_n":
                            $(this).attr("src",d+"carousel_next_normal.png");
                            break;
                    }
                }
                );
            x.find(".thumb_box").children("span").click(
                function(){
                    
                }
                );
            x.hover(
                function(){
                    stop();
                },
                function(){
                    v=setTimeout(play,m);
                }
                );
        }
        function previous(){
            if(w==0){
                w=y-2
            }else{
                if(w==1){
                    w=y-1
                }else{
                    w-=2
                }
            }
            play()
        }
        function next(){
            play()
        }
        function play(){
            clearTimeout(v);
            w++;
            if(w>=y){
                w=0
            }
            x.find(".slides_box").children("ul").animate({
                left:-(w*parseInt(q))
            },600);
            x.find(".thumb_box").children("span").children("img[class='thumb_num']").attr("src",d+"carousel_circle_normal.png");
            x.find(".thumb_box").children("span").children("img[class='thumb_num']").eq(w).attr("src",d+"carousel_circle_solid.png");
            x.find(".title_box").html('<a href="'+x.find(".slides_box").children("ul").children("li").children("a").eq(w).attr("href")+'" style="color:'+stc+'">'+x.find(".slides_box").children("ul").children("li").children("a").eq(w).attr("title")+'</a>');
            
            v=setTimeout(play,m)
        }
        function stop(){
            clearTimeout(v);
        }
        
        
    }
})(jQuery);