jQuery ->
  $('#issues').dataTable
    bFilter: true
    bJQueryUI: true
    sPaginationType: "full_numbers"
    sDom: "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>"

jQuery ->
  $(".followers_email").click ->
    $(".followrs").stop
    $(".followrs").slideToggle "slow"
    return

