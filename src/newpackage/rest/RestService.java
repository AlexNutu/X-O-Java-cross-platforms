/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage.rest;

import java.util.HashMap;
import java.util.Map.Entry;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;


@Path("/")
public class RestService {
    
    @GET
    @Path("/export/{value}")
    public Response export(@Context HttpServletRequest request, @PathParam("value") Integer value)
    {
        return Response.status(Response.Status.ACCEPTED).entity("valoarea de la url este " + value).build();
    }
    //TEST
}
