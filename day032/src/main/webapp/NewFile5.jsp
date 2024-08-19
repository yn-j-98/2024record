<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>"C:/YN/project-climbing"
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버튼1</title>
  <style>
        .box {
            width: 50px;
            height: 50px;
            border: 1px solid black;
            margin: 10px;
            display: inline-block;
        }
        .pink-box {
            background-color: pink;
        }
        .blue-box {
            background-color: blue;
        }
         #boxContainer {
            margin-top: 20px;
            display: flex; /* Flexbox를 사용하여 박스들을 정렬 */
        	flex-wrap: wrap; /* 박스가 넘칠 경우 다음 줄로 넘김 */
        }
    </style>
</head>
<body>


    <!-- 버튼 1: 분홍색 박스를 파란색으로 변경 -->
    <button id="changeColorButton" style="background-color: lightgray; border: none; color: black; padding: 10px 20px; font-size: 16px; cursor: pointer;">버튼 1</button>
    
    <!-- 버튼 2: 첫 번째 박스의 색상을 랜덤하게 변경 -->
    <button id="randomColorButton" style="background-color: lightgray; border: none; color: black; padding: 10px 20px; font-size: 16px; cursor: pointer;">버튼 2</button>

    <!-- 버튼 3: 새로운 파란색 박스를 생성 -->
    <button id="addBoxButton" style="background-color: lightgray; border: none; color: black; padding: 10px 20px; font-size: 16px; cursor: pointer;">버튼 3</button>

    <!-- 박스들을 담을 컨테이너 -->
    <div id="boxContainer">
    <!-- 기존에 만들어진 분홍색 박스 -->
    	<div id="pinkBox1" class="box pink-box">
    	</div>
    </div>

    <script>
        // 랜덤 색상을 생성하는 함수
        function getRandomColor() {
            const letters = '0123456789ABCDEF';
            let color = '#';
            for (let i = 0; i < 6; i++) {
                color += letters[Math.floor(Math.random() * 16)];
            }
            return color;
        }

        // 버튼 1 클릭 시 모든 분홍색 박스를 파란색으로 변경
        document.getElementById('changeColorButton').addEventListener('click', function() {
            const pinkBoxes = document.querySelectorAll('.pink-box');
            pinkBoxes.forEach(function(box) {
                box.classList.remove('pink-box');
                box.classList.add('blue-box');
            });
        });

        // 버튼 2 클릭 시 첫 번째 박스의 색상을 랜덤하게 변경
        document.getElementById('randomColorButton').addEventListener('click', function() {
            const firstBox = document.getElementById('pinkBox1');
            firstBox.style.backgroundColor = getRandomColor();
        });

        // 버튼 3 클릭 시 새로운 파란색 박스를 생성
        document.getElementById('addBoxButton').addEventListener('click', function() {
            const boxContainer = document.getElementById('boxContainer');
            const newBox = document.createElement('div');
            newBox.className = 'box blue-box'; // 새로운 박스에 파란색 클래스를 추가
            boxContainer.appendChild(newBox); // 박스를 컨테이너에 추가
        });
    </script>
       
    </body>
</html>