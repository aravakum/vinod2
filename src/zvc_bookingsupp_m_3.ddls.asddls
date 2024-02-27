@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity (Booking supplements)'
define view entity zvc_bookingsupp_M_3 as select from /dmo/booksuppl_m as BookSupplment
association to parent ZVC_BOOKING_M_3 as _Booking
    on $projection.BookingId = _Booking.BookingId and
       $projection.TravelId = _Booking.TravelId
   association[1..1] to zvc_travel_m_3  as _Travel on 
     $projection.TravelId =_Travel.TravelId 
        association[1..1] to /DMO/I_Supplement as _Product on 
     $projection.SupplementId = _Product.SupplementID 
   association[1..*] to /DMO/I_SupplementText as _Supplementtext on
    $projection.SupplementId = _Supplementtext.SupplementID
{
    
   key BookSupplment.travel_id as TravelId,
   key BookSupplment.booking_id as BookingId,
   key BookSupplment.booking_supplement_id as BookingSupplementId,
   BookSupplment.supplement_id as SupplementId,
   BookSupplment.price as Price,
   BookSupplment.currency_code as CurrencyCode,
   BookSupplment.last_changed_at as LastChangedAt,
   _Booking,
   _Travel,
   _Product,
   _Supplementtext
   
   
}
