import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="flash"
export default class extends Controller {
  connect() {
    setTimeout(() => this.dismiss(), 4000);
  }
  1;
  dismiss() {
    this.element.classList.add('hidden');
    setTimeout(() => this.element.remove(), 500);
  }
}
