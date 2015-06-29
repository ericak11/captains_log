$( document ).ready(function() {
  $('#load_daily_logs').on('click', function(){
    window.location.href = '/logs';
  });
  $('#expenses_index').on('click', function(){
    window.location.href = '/expenses';
  });
  $('#add_open_items').on('click', function(){
    window.location.href = '/open_items/new';
  });
  $('#add_daily_logs').on('click', function(){
    window.location.href = '/logs/new';
  });
  $('#add_crew_member').on('click', function(){
    window.location.href = '/users/new?crew=true';
  });
  $('#add_daily_activity').on('click', function(){
    window.location.href = '/daily_activities/new';
  });
  $('#add_expense').on('click', function(){
    window.location.href = '/expenses/new';
  });
});
