package com.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.eclipse.jdt.internal.compiler.ast.UnlikelyArgumentCheck;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.jta.JtaAfterCompletionSynchronization;

import com.model.DepartmentModel;
import com.model.EventModel;
import com.model.PlaceModel;

@Repository
public class EventRepoImpl implements EventRepo {

	@Autowired
	JdbcTemplate jt;
	@Override
	public boolean addEvent(EventModel em) {
		
		return jt.update("INSERT INTO organize_event VALUES('0',?,?,?,?,?)",em.getEname(),em.getPm().getId(),em.getDate(),em.getDm().getId(),em.getDescription())>0;
	}

	@Override
	public boolean isUpdate(EventModel em) {
		
		return jt.update("update organize_event set name=?,pid=?,edate=?,did=?,event_description=? where id=? ",em.getEname(),em.getPm().getId(),em.getDate(),em.getDm().getId(),em.getDescription(),em.getId())>0;
	}

	@Override
	public List<EventModel> getEvents() {
		
		return jt.query("select o.id,o.name,p.pid,p.pname,o.edate,d.did,d.dname,o.event_description from department d inner join organize_event o on d.did=o.did inner join place p on p.pid=o.pid",new RowMapper<EventModel>() {

			@Override
			public EventModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				EventModel eventModel=new EventModel();
				eventModel.setId(rs.getInt(1));
				eventModel.setEname(rs.getString(2));
				PlaceModel pModel=new PlaceModel();
				pModel.setId(rs.getInt(3));
				pModel.setName(rs.getString(4));
				eventModel.setPm(pModel);
				eventModel.setDate(rs.getDate(5));
				DepartmentModel departmentModel=new DepartmentModel();
				departmentModel.setId(rs.getInt(6));
				departmentModel.setName(rs.getString(7));
				eventModel.setDm(departmentModel);
				eventModel.setDescription(rs.getString(8));
				return eventModel;
			}
			
		});
	}

	@Override
	public EventModel getEventById(int id) {
		
		return jt.query("select o.id,o.name,p.pid,p.pname,o.edate,d.did,d.dname,o.event_description from department d inner join organize_event o on d.did=o.did inner join place p on p.pid=o.pid where o.id=?",new RowMapper<EventModel>() {

			@Override
			public EventModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				EventModel eventModel=new EventModel();
				eventModel.setId(rs.getInt(1));
				eventModel.setEname(rs.getString(2));
				PlaceModel pModel=new PlaceModel();
				pModel.setId(rs.getInt(3));
				pModel.setName(rs.getString(4));
				eventModel.setPm(pModel);
				eventModel.setDate(rs.getDate(5));
				DepartmentModel departmentModel=new DepartmentModel();
				departmentModel.setId(rs.getInt(6));
				departmentModel.setName(rs.getString(7));
				eventModel.setDescription(rs.getString(8));
				return eventModel;
			}
			
		},id).get(0);
	}

	@Override
	public boolean isDelete(int id) {
		// TODO Auto-generated method stub
		return jt.update("delete from organize_event where id=?",id)>0;
	}

	@Override
	public boolean registerStudentEvent(int eid, int sid) {
		             
		return jt.update("insert into student_event_register values(?,?)",eid,sid)>0;
	}

	@Override
	public List<EventModel> eventNotRegistred(int sid) {
		// TODO Auto-generated method stub
		return jt.query("SELECT o.id, o.name, p.pid, p.pname, o.edate, d.did, d.dname, o.event_description FROM organize_event o INNER JOIN department d ON d.did = o.did INNER JOIN place p ON p.pid = o.pid LEFT JOIN student_event_register ser ON ser.eid = o.id AND ser.sid =? WHERE ser.eid IS NULL;",new RowMapper<EventModel>() {

			@Override
			public EventModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				EventModel eventModel=new EventModel();
				eventModel.setId(rs.getInt(1));
				eventModel.setEname(rs.getString(2));
				PlaceModel pModel=new PlaceModel();
				pModel.setId(rs.getInt(3));
				pModel.setName(rs.getString(4));
				eventModel.setPm(pModel);
				eventModel.setDate(rs.getDate(5));
				DepartmentModel departmentModel=new DepartmentModel();
				departmentModel.setId(rs.getInt(6));
				departmentModel.setName(rs.getString(7));
				eventModel.setDm(departmentModel);
				eventModel.setDescription(rs.getString(8));
				return eventModel;
			}
			
		},sid);
	}

	@Override
	public List<EventModel> eventRegistredByStudent(int sid) {
		// TODO Auto-generated method stub
		return jt.query("SELECT o.id, o.name, p.pid, p.pname, o.edate, d.did, d.dname, o.event_description FROM organize_event o INNER JOIN department d ON d.did = o.did INNER JOIN place p ON p.pid = o.pid INNER JOIN student_event_register ser ON ser.eid = o.id WHERE ser.sid = ?",new RowMapper<EventModel>() {

			@Override
			public EventModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				EventModel eventModel=new EventModel();
				eventModel.setId(rs.getInt(1));
				eventModel.setEname(rs.getString(2));
				PlaceModel pModel=new PlaceModel();
				pModel.setId(rs.getInt(3));
				pModel.setName(rs.getString(4));
				eventModel.setPm(pModel);
				eventModel.setDate(rs.getDate(5));
				DepartmentModel departmentModel=new DepartmentModel();
				departmentModel.setId(rs.getInt(6));
				departmentModel.setName(rs.getString(7));
				eventModel.setDm(departmentModel);
				eventModel.setDescription(rs.getString(8));
				return eventModel;
			}
			
		},sid);
	}

	@Override
	public List<EventModel> completedEvent() {
		   
		return jt.query("select * from organize_event where edate<=now()",new RowMapper<EventModel>() {

			@Override
			public EventModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				EventModel eventModel=new EventModel();
				eventModel.setId(rs.getInt(1));
				eventModel.setEname(rs.getString(2));
				PlaceModel pModel=new PlaceModel();
				pModel.setId(rs.getInt(3));
				eventModel.setPm(pModel);
				eventModel.setDate(rs.getDate(4));
				DepartmentModel departmentModel=new DepartmentModel();
				departmentModel.setId(rs.getInt(5));
				eventModel.setDm(departmentModel);
				eventModel.setDescription(rs.getString(6));
				return eventModel;
				
			}
			
		});
	}

}
