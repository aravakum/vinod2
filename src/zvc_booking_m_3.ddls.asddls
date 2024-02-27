@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View entity (Booking)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZVC_BOOKING_M_3 as select from /dmo/booking_m as booking
composition[0..*] of zvc_bookingsupp_M_3 as _Bookingsupp
association to parent zvc_travel_m_3 as _Travel
    on $projection.TravelId = _Travel.TravelId
 association[1..1] to /DMO/I_Customer as _Customer
    on $projection.CustomerId = _Customer.CustomerID
 association[1..1] to /DMO/I_Carrier as _Carrier
    on $projection.CarrierId = _Carrier.AirlineID
 association[1..1] to /DMO/I_Connection as _Connection
    on $projection.CarrierId = _Connection.AirlineID and
       $projection.ConnectionId = _Connection.ConnectionID    
    
{
    
   key booking.travel_id as TravelId,
   key booking.booking_id as BookingId,
   booking.booking_date as BookingDate,
   booking.customer_id as CustomerId,
   booking.carrier_id as CarrierId,
   booking.connection_id as ConnectionId,
   booking.flight_date as FlightDate,
   @Semantics.amount.currencyCode: 'Currencycode'
   booking.flight_price as FlightPrice,
   booking.currency_code as CurrencyCode,
   booking.booking_status as BookingStatus,
   booking.last_changed_at as LastChangedAt,
   _Travel,
   _Customer,
   _Carrier,
   _Connection,
   _Bookingsupp
}

