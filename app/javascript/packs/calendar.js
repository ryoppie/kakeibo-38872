import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';

document.addEventListener('turbolinks:load', function() {
  let calendarEl = document.getElementById('calendar');

  if (calendarEl) {
    let calendar = new Calendar(calendarEl, {
      plugins: [ dayGridPlugin ],
      events: '/books/events' // イベントデータのエンドポイントを指定する
    });

    calendar.render();
  }
});