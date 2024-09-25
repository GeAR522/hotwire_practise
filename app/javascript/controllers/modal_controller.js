import { Controller } from '@hotwired/stimulus';

// referenced: https://www.bearer.com/blog/how-to-build-modals-with-hotwire-turbo-frames-stimulusjs#

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ['modal', 'form'];

  hideModal() {
    this.element.parentElement.removeAttribute('src');
    this.modalTarget.remove();
  }

  submitEnd(e) {
    if (e.detail.success) {
      window.location.reload();
    }
  }

  closeWithKeyboard(e) {
    if (e.code == 'Escape') {
      this.hideModal();
    }
  }

  // didnt work as intended
  closeBackground(e) {
    if (e && this.formTarget.contains(e.target)) {
      return;
    }

    this.hideModal();
  }
}
