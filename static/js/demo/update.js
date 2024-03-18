// 定义函数来返回颜色值
function getColorBySource(source) {
  if (source === '百度权重：') {
    return '#1ab394';
  } else if (source === '移动权重：') {
    return '#b3b3b3';
  } else if (source === '360权重：') {
    return '#e4f0fb';
  } else {
    return '#000000'; // 其他情况使用黑色
  }
}

// 定义函数来获取值
function getValueBySource(data, source) {
  for (let i = 0; i < data.length; i++) {
    if (data[i].source === source) {
      return data[i].value;
    }
  }
  return null;
}

// 获取数据并更新表格
$.ajax({
  url: "{% url 'seo_charts' %}",
  method: 'POST',
  dataType: "json"
  console.log("111");
  success: function (data) {
    console.log(data)
    // 更新表格
    $("#sparkline7").sparkline([
      getValueBySource(data, '百度权重：'),
      getValueBySource(data, '移动权重：'),
      getValueBySource(data, '360权重：')
    ], {
      type: 'pie',
      height: '150px',
      sliceColors: [
        getColorBySource('百度权重：'),
        getColorBySource('移动权重：'),
        getColorBySource('360权重：')
      ]
    });
  }
  error: function(){
  console.log("fuck");
  }
});
