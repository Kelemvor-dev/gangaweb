<?php defined('BASEPATH') OR exit('No direct script access allowed');

// inline help html. Only 'help_body' is used.
$lang['help_body'] = "
<h4>概觀</h4>
<p>導航選單，是用來控制你的網站主要導航區以及其他導航連結。</p>

<h4>導航群組</h4>
<p>導航連結會依據它所處的導航群組而分別顯示。大部分的網站佈景主題裡，Header 群組是主要的導航選單。
請查閱你的佈景主題相關文件，找出哪些是有被支援的導航群組。
如果你要在網站內容裡顯示某個群組，那麼只要使用這個短碼（tag）：{{ navigation:links group=\"導航群組名稱\" }}</p>

<h4>新增連結</h4>
<p>首先在你想要顯示的群組點選新增，然後輸入連結的標題，並選擇類型，
連結的類型有以下：
<ul>
<li>網址: 一個外部的連結 - http://google.com</li>
<li>網站連結(URI): 站內的連結 - galleries/portfolio-pictures</li>
<li>模組: 將連結到一個模組的索引頁面</li>
<li>頁面: 連到一個頁面</li>
</ul>
「目的」這個選項將指定使用者點選連結時，是否開啟新的視窗。 
(技巧：盡量少用開新視窗的選項，一般來說，那樣會讓使用者很討厭。)
「Class 樣式」這個欄位，可以讓你對單一連結加入 css 樣式。</p>
<p></p>

<h4>排序導航連結</h4>
<p>你的連結在管理系統中的順序，將直接反應在前端網站的介面上。
要改變連結的順序，請直接使用拖曳的方式到你想要的位置上。</p>";