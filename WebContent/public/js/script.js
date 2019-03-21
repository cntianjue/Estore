var timer = null,
index = 0,
pics = document.getElementsByClassName("banner-slide"),
lis = document.getElementsByTagName("li");
//封装一个代替getElementById()的方法
function byId(id){
return typeof(id) === "string"?document.getElementById(id):id;
}
function slideImg() {
var main = byId("main");
var banner = byId("banner");
main.onmouseover = function(){
stopAutoPlay();
}
main.onmouseout = function(){
startAutoPlay();
}
main.onmouseout();
//点击导航栏切换图片
for(var i=0;i<pics.length;i++){
lis[i].id = i;
//给每个li项绑定点击事件
lis[i].onclick = function(){
//获取当前li项的index值
index = this.id;
changeImg();
}
}
}
//开始播放轮播图
function startAutoPlay(){
timer = setInterval(function(){
index++;
if(index>3){
index = 0;
}
changeImg();
},1000);
}
//暂停播放
function stopAutoPlay(){
if (timer) {
clearInterval(timer);
}
}
//改变轮播图
function changeImg(){
for(var i=0;i<pics.length;i++){
pics[i].style.display = "none";
lis[i].className = "";
}
pics[index].style.display = "block";
lis[index].className = "changeColor";
}
slideImg();
