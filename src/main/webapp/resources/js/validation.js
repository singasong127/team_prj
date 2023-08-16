$(function(){
    function validateForm() {
        // Get references to the form elements
        var partyTitle = document.querySelector('input[placeholder="파티 제목"]');
        var partySport = document.getElementById('partySport');
        var partyNum = document.getElementById('partyNum');
        var playDt = document.getElementById('playDt');
        var playTimeStart = document.getElementById('playTimeStart');
        var playTimeEnd = document.getElementById('playTimeEnd');
        var genderOptions = document.getElementsByName('gender');
        var srcGo = document.getElementById('srcGo');
        var equipOptions = document.getElementsByName('equip');
        var partyDesc = document.getElementById('partyDesc');

        // Perform validation
        if (partyTitle.value.trim() === '') {
            alert('파티 제목을 입력해주세요.');
            return false;
        }

        if (partySport.selectedIndex === 0) {
            alert('종목을 선택해주세요.');
            return false;
        }

        if (partyNum.selectedIndex === 0) {
            alert('인원을 선택해주세요.');
            return false;
        }

        if (playDt.value.trim() === '') {
            alert('날짜를 입력해주세요.');
            return false;
        }

        if (playTimeStart.value.trim() === '' || playTimeEnd.value.trim() === '') {
            alert('시간을 입력해주세요.');
            return false;
        }

        var selectedGender = false;
        for (var i = 0; i < genderOptions.length; i++) {
            if (genderOptions[i].checked) {
                selectedGender = true;
                break;
            }
        }
        if (!selectedGender) {
            alert('성별을 선택해주세요.');
            return false;
        }

        if (srcGo.value.trim() === '') {
            alert('지역을 입력해주세요.');
            return false;
        }

        var selectedEquip = false;
        for (var i = 0; i < equipOptions.length; i++) {
            if (equipOptions[i].checked) {
                selectedEquip = true;
                break;
            }
        }
        if (!selectedEquip) {
            alert('장비 지참 여부를 선택해주세요.');
            return false;
        }

        if (partyDesc.value.trim() === '') {
            alert('파티 소개를 입력해주세요.');
            return false;
        }

        // All fields are valid
        return true;
    }
});