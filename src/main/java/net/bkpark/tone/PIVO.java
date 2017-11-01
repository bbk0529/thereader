package net.bkpark.tone;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class PIVO implements Serializable {
	int	no;
	String	sender;
	Date	date;
	double	Openness;
	double	Adventurousness;
	double	Artistic_interests;
	double	Emotionality;
	double	Imagination;
	double	Intellect;
	double	Authority_challenging;
	double	Conscientiousness;
	double	Achievement_striving;
	double	Cautiousness;
	double	Dutifulness;
	double	Orderliness;
	double	Self_discipline;
	double	Self_efficacy;
	double	Extraversion;
	double	Activity_level;
	double	Assertiveness;
	double	Cheerfulness;
	double	Excitement_seeking;
	double	Outgoing;
	double	Gregariousness;
	double	Agreeableness;
	double	Altruism;
	double	Cooperation;
	double	Modesty;
	double	Uncompromising;
	double	Sympathy;
	double	Trust;
	double	Emotional_range;
	double	Fiery;
	double	Prone_to_worry;
	double	Melancholy;
	double	Immoderation;
	double	Self_consciousness;
	double	Susceptible_to_stress;
			

	public void setUpAll(String sender, Date fdate, double [] percentile) {
		this.sender = sender;
		this.date = fdate;
		Openness=percentile[0];
		Adventurousness=percentile[1];
		Artistic_interests=percentile[2];
		Emotionality=percentile[3];
		Imagination=percentile[4];
		Intellect=percentile[5];
		Authority_challenging=percentile[6];
		Conscientiousness=percentile[7];
		Achievement_striving=percentile[8];
		Cautiousness=percentile[9];
		Dutifulness=percentile[10];
		Orderliness=percentile[11];
		Self_discipline=percentile[12];
		Self_efficacy=percentile[13];
		Extraversion=percentile[14];
		Activity_level=percentile[15];
		Assertiveness=percentile[16];
		Cheerfulness=percentile[17];
		Excitement_seeking=percentile[18];
		Outgoing=percentile[19];
		Gregariousness=percentile[20];
		Agreeableness=percentile[21];
		Altruism=percentile[22];
		Cooperation=percentile[23];
		Modesty=percentile[24];
		Uncompromising=percentile[25];
		Sympathy=percentile[26];
		Trust=percentile[27];
		Emotional_range=percentile[28];
		Fiery=percentile[29];
		Prone_to_worry=percentile[30];
		Melancholy=percentile[31];
		Immoderation=percentile[32];
		Self_consciousness=percentile[33];
		Susceptible_to_stress=percentile[34];
	}


	/*private String [] feats = {
		"SetOpenness", 
		"SetAdventurousness",
		"SetArtistic_interests",
		"SetEmotionality",
		"SetImagination",
		"SetIntellect",
		"SetAuthority_challenging",
		"SetConscientiousness",
		"SetAchievement_striving",
		"SetCautiousness",
		"SetDutifulness",
		"SetOrderliness",
		"SetSelf_discipline",
		"SetSelf_efficacy",
		"SetExtraversion",
		"SetActivity_level",
		"SetAssertiveness",
		"SetCheerfulness",
		"SetExcitement_seeking",
		"SetOutgoing",
		"SetGregariousness",
		"SetAgreeableness",
		"SetAltruism",
		"SetCooperation",
		"SetModesty",
		"SetUncompromising",
		"SetSympathy",
		"SetTrust",
		"SetEmotional_range",
		"SetFiery",
		"SetProne_to_worry",
		"SetMelancholy",
		"SetImmoderation",
		"SetSelf_consciousness",
		"SetSusceptible_to_stress"
	};	*/
	
	

	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
		
	}


	public String getSender() {
		return sender;
	}


	public void setSender(String sender) {
		this.sender = sender;
	}


	public Date getDate() {
		return date;
	}


	public void setDate(Date date) {
		this.date = date;
	}


	public double getOpenness() {
		return Openness;
	}


	public void setOpenness(double openness) {
		Openness = openness;
	}


	public double getAdventurousness() {
		return Adventurousness;
	}


	public void setAdventurousness(double adventurousness) {
		Adventurousness = adventurousness;
	}


	public double getArtistic_interests() {
		return Artistic_interests;
	}


	public void setArtistic_interests(double artistic_interests) {
		Artistic_interests = artistic_interests;
	}


	public double getEmotionality() {
		return Emotionality;
	}


	public void setEmotionality(double emotionality) {
		Emotionality = emotionality;
	}


	public double getImagination() {
		return Imagination;
	}


	public void setImagination(double imagination) {
		Imagination = imagination;
	}


	public double getIntellect() {
		return Intellect;
	}


	public void setIntellect(double intellect) {
		Intellect = intellect;
	}


	public double getAuthority_challenging() {
		return Authority_challenging;
	}


	public void setAuthority_challenging(double authority_challenging) {
		Authority_challenging = authority_challenging;
	}


	public double getConscientiousness() {
		return Conscientiousness;
	}


	public void setConscientiousness(double conscientiousness) {
		Conscientiousness = conscientiousness;
	}


	public double getAchievement_striving() {
		return Achievement_striving;
	}


	public void setAchievement_striving(double achievement_striving) {
		Achievement_striving = achievement_striving;
	}


	public double getCautiousness() {
		return Cautiousness;
	}


	public void setCautiousness(double cautiousness) {
		Cautiousness = cautiousness;
	}


	public double getDutifulness() {
		return Dutifulness;
	}


	public void setDutifulness(double dutifulness) {
		Dutifulness = dutifulness;
	}


	public double getOrderliness() {
		return Orderliness;
	}


	public void setOrderliness(double orderliness) {
		Orderliness = orderliness;
	}


	public double getSelf_discipline() {
		return Self_discipline;
	}


	public void setSelf_discipline(double self_discipline) {
		Self_discipline = self_discipline;
	}


	public double getSelf_efficacy() {
		return Self_efficacy;
	}


	public void setSelf_efficacy(double self_efficacy) {
		Self_efficacy = self_efficacy;
	}


	public double getExtraversion() {
		return Extraversion;
	}


	public void setExtraversion(double extraversion) {
		Extraversion = extraversion;
	}


	public double getActivity_level() {
		return Activity_level;
	}


	public void setActivity_level(double activity_level) {
		Activity_level = activity_level;
	}


	public double getAssertiveness() {
		return Assertiveness;
	}


	public void setAssertiveness(double assertiveness) {
		Assertiveness = assertiveness;
	}


	public double getCheerfulness() {
		return Cheerfulness;
	}


	public void setCheerfulness(double cheerfulness) {
		Cheerfulness = cheerfulness;
	}


	public double getExcitement_seeking() {
		return Excitement_seeking;
	}


	public void setExcitement_seeking(double excitement_seeking) {
		Excitement_seeking = excitement_seeking;
	}


	public double getOutgoing() {
		return Outgoing;
	}


	public void setOutgoing(double outgoing) {
		Outgoing = outgoing;
	}


	public double getGregariousness() {
		return Gregariousness;
	}


	public void setGregariousness(double gregariousness) {
		Gregariousness = gregariousness;
	}


	public double getAgreeableness() {
		return Agreeableness;
	}


	public void setAgreeableness(double agreeableness) {
		Agreeableness = agreeableness;
	}


	public double getAltruism() {
		return Altruism;
	}


	public void setAltruism(double altruism) {
		Altruism = altruism;
	}


	public double getCooperation() {
		return Cooperation;
	}


	public void setCooperation(double cooperation) {
		Cooperation = cooperation;
	}


	public double getModesty() {
		return Modesty;
	}


	public void setModesty(double modesty) {
		Modesty = modesty;
	}


	public double getUncompromising() {
		return Uncompromising;
	}


	public void setUncompromising(double uncompromising) {
		Uncompromising = uncompromising;
	}


	public double getSympathy() {
		return Sympathy;
	}


	public void setSympathy(double sympathy) {
		Sympathy = sympathy;
	}


	public double getTrust() {
		return Trust;
	}


	public void setTrust(double trust) {
		Trust = trust;
	}


	public double getEmotional_range() {
		return Emotional_range;
	}


	public void setEmotional_range(double emotional_range) {
		Emotional_range = emotional_range;
	}


	public double getFiery() {
		return Fiery;
	}


	public void setFiery(double fiery) {
		Fiery = fiery;
	}


	public double getProne_to_worry() {
		return Prone_to_worry;
	}


	public void setProne_to_worry(double prone_to_worry) {
		Prone_to_worry = prone_to_worry;
	}


	public double getMelancholy() {
		return Melancholy;
	}


	public void setMelancholy(double melancholy) {
		Melancholy = melancholy;
	}


	public double getImmoderation() {
		return Immoderation;
	}


	public void setImmoderation(double immoderation) {
		Immoderation = immoderation;
	}


	public double getSelf_consciousness() {
		return Self_consciousness;
	}


	public void setSelf_consciousness(double self_consciousness) {
		Self_consciousness = self_consciousness;
	}


	public double getSusceptible_to_stress() {
		return Susceptible_to_stress;
	}


	public void setSusceptible_to_stress(double susceptible_to_stress) {
		Susceptible_to_stress = susceptible_to_stress;
	}



	@Override
	public String toString() {
		return "PIVO [no=" + no + ", sender=" + sender + ", date=" + date + ", Openness=" + Openness
				+ ", Adventurousness=" + Adventurousness + ", Artistic_interests=" + Artistic_interests
				+ ", Emotionality=" + Emotionality + ", Imagination=" + Imagination + ", Intellect=" + Intellect
				+ ", Authority_challenging=" + Authority_challenging + ", Conscientiousness=" + Conscientiousness
				+ ", Achievement_striving=" + Achievement_striving + ", Cautiousness=" + Cautiousness + ", Dutifulness="
				+ Dutifulness + ", Orderliness=" + Orderliness + ", Self_discipline=" + Self_discipline
				+ ", Self_efficacy=" + Self_efficacy + ", Extraversion=" + Extraversion + ", Activity_level="
				+ Activity_level + ", Assertiveness=" + Assertiveness + ", Cheerfulness=" + Cheerfulness
				+ ", Excitement_seeking=" + Excitement_seeking + ", Outgoing=" + Outgoing + ", Gregariousness="
				+ Gregariousness + ", Agreeableness=" + Agreeableness + ", Altruism=" + Altruism + ", Cooperation="
				+ Cooperation + ", Modesty=" + Modesty + ", Uncompromising=" + Uncompromising + ", Sympathy=" + Sympathy
				+ ", Trust=" + Trust + ", Emotional_range=" + Emotional_range + ", Fiery=" + Fiery + ", Prone_to_worry="
				+ Prone_to_worry + ", Melancholy=" + Melancholy + ", Immoderation=" + Immoderation
				+ ", Self_consciousness=" + Self_consciousness + ", Susceptible_to_stress=" + Susceptible_to_stress 
				+ "]";
	}
	

}
