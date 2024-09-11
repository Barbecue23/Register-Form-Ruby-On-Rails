document.addEventListener('DOMContentLoaded', function() {
    const deleteButtons = document.querySelectorAll('button.delete-button');
    const modal = document.getElementById('deleteModal');
    const confirmDeleteButton = document.getElementById('confirmDelete');
    const cancelDeleteButton = document.getElementById('cancelDelete');
    let formToDelete = null;
  
    // แสดง modal เมื่อคลิกปุ่มลบ
    deleteButtons.forEach(button => {
      button.addEventListener('click', function(event) {
        event.preventDefault();
        formToDelete = this.closest('form');
        modal.style.display = 'block';
      });
    });
  
    // ยืนยันการลบ
    confirmDeleteButton.addEventListener('click', function() {
      if (formToDelete) {
        formToDelete.submit();
      }
    });
  
    // ยกเลิกการลบ
    cancelDeleteButton.addEventListener('click', function() {
      modal.style.display = 'none';
      formToDelete = null;
    });
  
    // ปิด modal เมื่อคลิกภายนอก
    window.addEventListener('click', function(event) {
      if (event.target === modal) {
        modal.style.display = 'none';
        formToDelete = null;
      }
    });
  });
  