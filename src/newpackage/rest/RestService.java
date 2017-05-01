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
    @Path("/export/{maxItems}")
    public Response exportCos(@Context HttpServletRequest request, @PathParam("maxItems") Integer maxItems)
    {
        HttpSession session = request.getSession(true);
        HashMap<String, Integer> cos = (HashMap<String, Integer>) session.getAttribute("cos");
        if (cos == null)
        {
            return Response.status(200).entity("").build();
        }
        else
        {
            StringBuilder returnValue = new StringBuilder();
            int itemNr = 1;
            for(Entry<String, Integer> entry : cos.entrySet())
            {
                if (itemNr > maxItems)
                {
                    break;
                }
                returnValue.append(entry.getKey()).append(" - ").append(entry.getValue());
                itemNr++;
            }
            return Response.status(200).entity(returnValue.toString()).build();
        }
    }
}
