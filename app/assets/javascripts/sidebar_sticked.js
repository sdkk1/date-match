$(function($){
  if($('.sidebar__nav').length){
    const row = $(".row");
    const sidebar = $(".sidebar");
    const sidebar_sticked = $(".sidebar__nav");

    // サイドバーの位置
    const sidebar_top = sidebar.offset().top;
    // 固定する要素の元々の位置
    const sidebar_sticked_original_top = sidebar_sticked.offset().top;
    // 固定する要素の高さ
    const sidebar_sticked_height = sidebar_sticked.height();

    // スクロールかリサイズ時
    $(window).on('scroll resize', function(){
        // 現在の位置
        const scrollTop = $(document).scrollTop();
        // メイン要素の最後尾
        const row_bottom = row.offset().top + row.height();
        // 現在の位置が、初期位置より下で、メイン要素の最後尾より上なら、画面上部にサイドバーを固定
        if ((scrollTop > sidebar_sticked_original_top) && (scrollTop < row_bottom - sidebar_sticked_height)){
            sidebar_sticked.css({'position': 'fixed',
                'top': 0,
                'width': sidebar.width()
            });
        } else if(scrollTop >= row_bottom - sidebar_sticked_height){
            // 現在位置がメイン要素の最後尾より下なら、メイン要素の最後尾にサイドバーを位置させる
            sidebar_sticked.css({'position': 'absolute',
                'top': row_bottom - sidebar_sticked_height - sidebar_top,
                'width': sidebar.width()
            });
        } else {
            // 現在位置が初期位置より上なら、幅だけリサイズする
            sidebar_sticked.css({'position': 'static',
                'width': sidebar.width()
            });
        }
    });
  }
});
