import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
static targets = ["modal"]

  connect() {
    this.modal = document.getElementById("deleteModal");
  }

  open() {
    this.modal.style.display = "block";
  }

  close() {
    this.modal.style.display = "none";
  }

  confirm(event) {
    event.preventDefault();
    fetch(this.data.get("url"), {
      method: "DELETE",
      headers: {
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
        "Accept": "application/json",
      }
    }).then(response => {
      if (response.ok) {
        this.close();
        Turbo.visit(window.location.href); // รีเฟรชหน้า
      } else {
        console.error("Delete failed");
      }
    }).catch(error => console.error("Error:", error));
  }

  cancel() {
    this.close();
  }
}
