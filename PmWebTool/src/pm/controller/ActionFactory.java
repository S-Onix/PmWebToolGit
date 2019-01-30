package pm.controller;

import pm.controller.action.Action;
import pm.controller.action.IndexAction;

public class ActionFactory {
	private static ActionFactory instance = new ActionFactory();

	public static ActionFactory getInstance() {
		return instance;
	}

	public Action getAction(String command) {
		Action action = null;
		if (command.equals("index")) {
			action = new IndexAction();
		/*} else if (command.equals("join_form")) {
			action = new JoinFormAction();
		} else if (command.equals("join")) {
			action = new JoinAction();
		} else if (command.equals("id_check_form")) {
			action = new IdCheckFormAction();
		} else if (command.equals("login_form")) {
			action = new LoginFormAction();
		} else if (command.equals("login")) {
			action = new LoginAction();
		} else if (command.equals("change_pw_form")) {
			action = new ChangePwFormAction();
		} else if (command.equals("change_pw")) {
			action = new ChangePwAction();
		} else if (command.equals("project_form")) {
			action = new ProjectFormAction();
		} else if (command.equals("project_add_form")) {
			action = new ProjectAddFormAction();
		} else if (command.equals("project_add")) {
			action = new ProjectAddAction();
		} else if (command.equals("project_update_form")) {
			action = new ProjectUpdateFormAction();
		} else if (command.equals("project_update")) {
			action = new ProjectUpdateAction();
		} else if (command.equals("project_delete")) {
			action = new ProjectDeleteAction();
		} else if (command.equals("project_detail_form")) {
			action = new ProjectDetailFormAction();
		} else if (command.equals("card_add_form")) {
			action = new CardAddFormAction();
		} else if (command.equals("card_add")) {
			action = new CardAddAction();
		} else if (command.equals("card_update_form")) {
			action = new CardUpdateFormAction();
		} else if (command.equals("card_update")) {
			action = new CardUpdateAction();
		} else if (command.equals("card_move")) {
			action = new CardMoveAction();
		} else if (command.equals("card_delete")) {
			action = new CardDeleteAction();
		} else if (command.equals("board_form")) {
			action = new BoardFormAction();
		} else if (command.equals("board_write_form")) {
			action = new BoardWriteFormAction();
		} else if (command.equals("board_write")) {
			action = new BoardWriteAction();
		} else if (command.equals("board_update_form")) {
			action = new BoardUpdateFormAction();
		} else if (command.equals("board_update")) {
			action = new BoardUpdateAction();
		} else if (command.equals("board_delete")) {
			action = new BoardDeleteAction();
		} else if (command.equals("profile_form")) {
			action = new ProfileFormAction();
		} else if (command.equals("profile_update_form")) {
			action = new ProfileUpdateFormAction();
		} else if (command.equals("profile_update")) {
			action = new ProfileUpdateAction();
		} else if (command.equals("logout")) {
			action = new LogoutAction();
		} else if (command.equals("withdraw")) {
			action = new WithdrawAction();*/
		}
		return action;

	}
}