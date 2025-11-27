defmodule GrncHotelWeb.AgentController do
  use GrncHotelWeb, :controller

  alias GrncHotel.Utils

  def index(conn, _params) do
    req = Utils.extract_data_from_agents()

    status =
      case req do
        [] ->
          "failure"

        [_ | _] ->
          "success"
      end

    json(conn, %{data: req, status: status})
  end
end
