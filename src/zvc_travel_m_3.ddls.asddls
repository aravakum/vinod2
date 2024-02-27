@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel view for managed case'
define root view entity zvc_travel_m_3 as select from /dmo/travel_m as travel
composition[0..*] of ZVC_BOOKING_M_3 as _Booking
   association [1] to ZI_agency_3 as _Agency
    on $projection.AgencyId = _Agency.AgencyId
    association [1] to zi_customer_3 as _Customer
    on $projection.CustomerId = _Customer.CustomerId
    association [1] to I_Currency  as _Currency
    on $projection.CurrencyCode = _Currency.Currency
{
key travel.travel_id as TravelId,
travel.agency_id as AgencyId,
travel.customer_id as CustomerId,
travel.begin_date as BeginDate,
travel.end_date as EndDate,
@Semantics.amount.currencyCode: 'CurrencyCode'
travel.booking_fee as BookingFee,
@Semantics.amount.currencyCode: 'CurrencyCode'
travel.total_price as TotalPrice,
travel.currency_code as CurrencyCode,
travel.description as Description,
travel.overall_status as OverallStatus,
@Semantics.user.createdBy: true
travel.created_by as CreatedBy,
@Semantics.systemDateTime.createdAt: true
travel.created_at as CreatedAt,
@Semantics.user.lastChangedBy: true
travel.last_changed_by as LastChangedBy,
@Semantics.systemDateTime.lastChangedAt: true
travel.last_changed_at as LastChangedAt,
    _Agency,
    _Booking,
    _Customer,
    _Currency // Make a
}

