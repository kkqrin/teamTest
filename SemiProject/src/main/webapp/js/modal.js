        const openButton=document.getElementById("open");
        const modal = document.querySelector(".modal");

        /*x버튼을 누르거나 배경 눌렀을때 화면이 닫히도록하기 위함*/
        const overlay = modal.querySelector(".modal_overlay");
        const closeBtn = modal.querySelector("#close1");
        const openModal  = () => {
            modal.classList.remove("hidden");
        }

        const closeModal = () => {
            modal.classList.add("hidden");
        }
        overlay.addEventListener("click",closeModal);
        closeBtn.addEventListener("click",closeModal);
        openButton.addEventListener("click",openModal);

       