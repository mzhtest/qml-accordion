import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 1920
    height: 1024
    title: qsTr("qml实现手风琴效果")
    //存放图片路径数组
    property var imgurl: [
        "./images/ad1.jpg",
        "./images/ad2.jpg",
        "./images/ad3.jpg",
        "./images/ad4.jpg",
        "./images/ad5.jpg",
        "./images/ad6.jpg",
    ]

    Rectangle {
        width: 960; height: 300
        anchors.centerIn: parent
        clip: true
        Row {
            Repeater {
                id: adRepeater
                model: imgurl
                Rectangle {
                    width: 160
                    height: 300
                    //给变化的宽度添加动画效果
                    Behavior on width {PropertyAnimation {duration: 500} }
                    //给各个矩形加载广告图片
                    Image {
                        width: 670
                        height: 300
                        source: modelData
                    }
                    //鼠标悬停区域
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered:{
                            //把选中区域的宽放大，其他区域的宽缩小
                            for(var i=0;i<imgurl.length;i++){
                                if(i === index){
                                    parent.width = 460
                                }else{
                                    adRepeater.itemAt(i).width = 100
                                }
                            }
                        }
                        onExited:{
                            //把所有区域的宽还原
                            for(var i=0;i<imgurl.length;i++){
                                adRepeater.itemAt(i).width = 160
                            }
                        }
                    }
                }
            }
        }
    }

}
