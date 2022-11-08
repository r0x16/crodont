package module

import (
	"net/http"

	"github.com/labstack/echo/v4"
	"github.com/r0x16/GroundForce/src/shared/domain"
	"github.com/r0x16/GroundForce/src/shared/infraestructure/drivers"
)

type MainModule struct {
	Bundle *drivers.ApplicationBundle
}

var _ domain.ApplicationModule = &MainModule{}

// Setups base main module routes
func (m *MainModule) Setup() {
	m.Bundle.Server.GET("/", func(c echo.Context) error {
		return c.Render(http.StatusOK, "index", echo.Map{
			"title": "GroundForce",
		})
	})
}
