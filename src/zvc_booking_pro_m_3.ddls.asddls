@EndUserText.label: 'Booking projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@UI:{
headerInfo:{ typeName:'Booking',typeNamePlural:'Bookings',
title: {type : #STANDARD,label:'Booking', value: 'booking_id' }
}}
@Search.searchable: true
define view entity ZVC_BOOKING_PRO_M_3
as projection on ZVC_BOOKING_M_3
{
@UI.facet: [{id : 'Booking',
purpose: #STANDARD,
type: #IDENTIFICATION_REFERENCE,
label: 'Booking',
position: 10},
{
id: 'BookingSupplement',
purpose: #STANDARD,
type: #LINEITEM_REFERENCE,
label: 'Booking',
position: 20,
targetElement: '_Bookingsupp'
}
]
@Search.defaultSearchElement: true
@UI:{identification:[{position: 10 }]}
key TravelId as travel_id,
@UI: { lineItem : [{ position: 20, importance: #HIGH }],
identification:[{position: 20 }]}
key BookingId as booking_id,
@UI: { lineItem : [{ position: 30, importance: #HIGH }],
identification:[{position: 30 }]}
BookingDate as booking_date,
@UI: { lineItem : [{ position: 40, importance: #HIGH }],
identification:[{position: 40 }]}
CustomerId as customer_id,
@UI: { lineItem : [{ position: 50, importance: #HIGH }],
identification:[{position: 50 }]}
CarrierId as carrier_id,
@UI: { lineItem : [{ position: 60, importance: #HIGH }],
identification:[{position: 60 }]}
ConnectionId as connection_id,
@UI: { lineItem : [{ position: 70, importance: #HIGH }],
identification:[{position: 70 }]}
FlightDate as flight_date,
@UI: { lineItem : [{ position: 80, importance: #HIGH }],
identification:[{position: 80 }]}
@Semantics.amount.currencyCode : 'currency_code'
FlightPrice as flight_price,
@UI: { lineItem : [{ position: 90, importance: #HIGH }],
identification:[{position: 90 }]}
@Semantics.currencyCode: true
CurrencyCode as currency_code,
@UI: { lineItem : [{ position: 100, importance: #HIGH }],
identification:[{position: 100 }]}
BookingStatus as booking_status,
@UI.hidden: true
LastChangedAt as lastchanged_at,
/* Associations */
_Travel : redirected to parent zvc_travel_pro_M_3,
_Bookingsupp : redirected to composition child ZVC_BOOKINGSUPP_PRO_M_3,
_Carrier,
_Connection,
_Customer

}
