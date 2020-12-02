// Code generated by go-swagger; DO NOT EDIT.

package vaccination

// This file was generated by the swagger tool.
// Editing this file might prove futile when you re-run the generate command

import (
	"net/http"

	"github.com/go-openapi/runtime/middleware"
)

// GetPreEnrollmentsForFacilityHandlerFunc turns a function with the right signature into a get pre enrollments for facility handler
type GetPreEnrollmentsForFacilityHandlerFunc func(GetPreEnrollmentsForFacilityParams, interface{}) middleware.Responder

// Handle executing the request and returning a response
func (fn GetPreEnrollmentsForFacilityHandlerFunc) Handle(params GetPreEnrollmentsForFacilityParams, principal interface{}) middleware.Responder {
	return fn(params, principal)
}

// GetPreEnrollmentsForFacilityHandler interface for that can handle valid get pre enrollments for facility params
type GetPreEnrollmentsForFacilityHandler interface {
	Handle(GetPreEnrollmentsForFacilityParams, interface{}) middleware.Responder
}

// NewGetPreEnrollmentsForFacility creates a new http.Handler for the get pre enrollments for facility operation
func NewGetPreEnrollmentsForFacility(ctx *middleware.Context, handler GetPreEnrollmentsForFacilityHandler) *GetPreEnrollmentsForFacility {
	return &GetPreEnrollmentsForFacility{Context: ctx, Handler: handler}
}

/*GetPreEnrollmentsForFacility swagger:route GET /preEnrollments vaccination getPreEnrollmentsForFacility

Get all pre enrollments applicable to assigned facility

*/
type GetPreEnrollmentsForFacility struct {
	Context *middleware.Context
	Handler GetPreEnrollmentsForFacilityHandler
}

func (o *GetPreEnrollmentsForFacility) ServeHTTP(rw http.ResponseWriter, r *http.Request) {
	route, rCtx, _ := o.Context.RouteInfo(r)
	if rCtx != nil {
		r = rCtx
	}
	var Params = NewGetPreEnrollmentsForFacilityParams()

	uprinc, aCtx, err := o.Context.Authorize(r, route)
	if err != nil {
		o.Context.Respond(rw, r, route.Produces, route, err)
		return
	}
	if aCtx != nil {
		r = aCtx
	}
	var principal interface{}
	if uprinc != nil {
		principal = uprinc
	}

	if err := o.Context.BindValidRequest(r, route, &Params); err != nil { // bind params
		o.Context.Respond(rw, r, route.Produces, route, err)
		return
	}

	res := o.Handler.Handle(Params, principal) // actually handle the request

	o.Context.Respond(rw, r, route.Produces, route, res)

}
