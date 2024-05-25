package com.techm.inventory.utill;

import java.util.List;

import com.techm.inventory.model.User;
import com.techm.inventory.model.UserCart;

public class EmailMsgUtility {

	public static String purchaseListTableFormat(List<UserCart> userCarts, User user, Double totalPrice) {

		String msg = "<p>Dear " + user.getFirstName() + "here is your purchase list : </p> <br>";
		String msg2 = """
				<table>
					<tr>
						<th>Product Name</th>
						<th>Product Code</th>
						<th>Quantity</th>
						<th>Price</th>
						<th>Net Price</th>
					</tr>
					<tbody>
				""";
		String msg3 = "";
		for (UserCart cart : userCarts) {
			String productMsg = """
						<tr>
							<td>%s </td>
							<td>%s</td>
							<td>%s</td>
							<td>%.1f</td>
							<td>%.1f</td>
						</tr>
					""";
			String msgBody = String.format(productMsg, cart.getProductName(), cart.getProductCode(), cart.getQuantity(),
					cart.getPrice(), cart.getTotalPrice());
			msg3 = msg3 + msgBody;
		}

		String msg4 = """
					</tbody>
					</table>
				""";
		String msg5 = "<br><p>Total Price : " + totalPrice + "</p>";

		return msg + msg2 + msg3 + msg4 + msg5;
	}

}
