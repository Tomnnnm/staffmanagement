<template>
	<div class="page_root" id="root_index">
		<div class="warp">
			<div class="container-fluid">
				<el-row>
					<el-col :span="4">
						<mm_label bg_color="bg_purple" icon="el-icon-user-solid" :url="url_user_count" unit="人"
								  title="用户数量"></mm_label>
					</el-col>
				</el-row>

				<el-row>
					<el-col v-if="user_group == '管理员' || $check_figure('/employee_attendance/table')" :span="8">
						<div class="card chart">
							<newLineChart v-if="line_obj_employee_attendance.values.length > 0" id="line_obj_employee_attendance" :vm="line_obj_employee_attendance" :title="'员工考勤统计'">
							</newLineChart>
							<div v-if="!line_obj_employee_attendance.values.length">员工考勤没有符合条件的数据</div>
						</div>
					</el-col>
					<el-col v-if="user_group == '管理员' || $check_figure('/employee_leave/table')" :span="8">
						<div class="card chart">
							<pieChart v-if="list_employee_leave.length" id="list_employee_leave" :list="list_employee_leave" :title="'员工请假统计'"></pieChart>
							<div v-if="!list_employee_leave.length">员工请假没有符合条件的数据</div>
						</div>
					</el-col>
				</el-row>
			</div>
		</div>
	</div>
</template>
<script>
	import mixin from "@/mixins/page.js";
	import pieChart from "@/components/charts/pie_chart";
	import barChart from "@/components/charts/bar_chart";
	import newBarChart from "@/components/charts/new_bar_chart";
	import lineChart from "@/components/charts/line_chart";
	import newLineChart from "@/components/charts/new_line_chart";
	import mm_label from "@/components/mm_label.vue";
	export default {
		mixins: [mixin],
		name: "Home",
		components: {
			pieChart,
			barChart,
			newBarChart,
			lineChart,
			newLineChart,
			mm_label
		},
		data() {
			return {
				isAdmin: false,
				recognitionType: "",
				activeName: "third",
				line_obj_employee_attendance:{
					names:[],
					xAxis: [],
					values:[]
				},
				list_employee_leave: [],
				url_user_count: "~/api/user/count?",
			};
		},
		created() {
			this.getUserInfo();
			// 执行员工考勤数据获取
			this.get_list_employee_attendance();
			// 执行员工请假数据获取
			this.get_list_employee_leave();
			
			
		},
		mounted() {},
		methods: {
			async get_nickname(list,flag){
				if (flag) {
					for (let i=0;i<list.length;i++){
						await this.$get(
								"~/api/user/get_obj?user_id="+list[i],
								null,
								(json) => {
									if (json.result) {
										list[i] = json.result.obj.nickname;
									}
								});
					}
				}else {
					for (let i=0;i<list.length;i++){
						await this.$get(
								"~/api/user/get_obj?user_id="+list[i].name,
								null,
								(json) => {
									if (json.result) {
										list[i].name = json.result.obj.nickname;
									}
								});
					}
				}
			},
			// 获取员工考勤统计折线图
			async get_list_employee_attendance() {
				let group_by_value = "staff";
				let data = {};
				let flag = true;
				let user_group = this.$store.state.user.user_group;
				let user_id = this.$store.state.user.user_id;
				if (user_group!='管理员'){
					if (user_group=="员工用户"){
						data.staff = user_id;
					}
				}
				await this.$get(
					"~/api/employee_attendance/get_list?groupby="+group_by_value,data,
					(json) => {
						if (json.result) {
							let list = json.result.list;
							let name_list = [];
							for (let i=0;i<list.length;i++){
								name_list.push(list[i].staff);
							}
							this.line_obj_employee_attendance.names = name_list;
							this.get_list_employee_attendance_sub("staff",flag);
						}
				});
			},
			async get_list_employee_attendance_sub(v1,names_flag) {
				let data = {};
				let flag = false;
				let user_group = this.$store.state.user.user_group;
				let user_id = this.$store.state.user.user_id;
				if (user_group!='管理员'){
					if (user_group=="员工用户"){
						data.staff = user_id;
					}
				}
				await this.$get(
					"~/api/employee_attendance/get_list?groupby=attendance_month",data,
					(json) => {
						if (json.result) {
							let list = json.result.list;
							let xAxis_list = [];
							for (let i=0;i<list.length;i++){
								xAxis_list.push(list[i].attendance_month);
							}
							this.line_obj_employee_attendance.xAxis = xAxis_list;
							this.get_list_employee_attendance_sub_sub(v1,"attendance_month",names_flag,flag);
						}
				});
			},
			async get_list_employee_attendance_sub_sub(v1,v2,names_flag,xAxis_flag) {
				let data_str = "{\""+v1+"\":\"\",\""+v2+"\":\"\"}";
				let data = JSON.parse(data_str);
				let user_group = this.$store.state.user.user_group;
				let user_id = this.$store.state.user.user_id;
				if (user_group!='管理员'){
					if (user_group=="员工用户"){
						data.staff = user_id;
					}
				}
				for (let i=0;i<this.line_obj_employee_attendance.xAxis.length;i++){
					let list = []
					for (let j=0;j<this.line_obj_employee_attendance.names.length;j++){
						data[v2] = this.line_obj_employee_attendance.xAxis[i];
						data[v1] = this.line_obj_employee_attendance.names[j];
						await this.$get(
								"~/api/employee_attendance/sum?field=attendance",
								data,
								(json) => {
									if (json.result) {
										list[j] = json.result;
									}else {
										list[j] = 0;
									}
								});
					}
					this.line_obj_employee_attendance.values.push(list)
				}
				if (names_flag){
					this.get_nickname(this.line_obj_employee_attendance.names,true);
				}
				if (xAxis_flag){
					this.get_nickname(this.line_obj_employee_attendance.xAxis,true);
				}
			},
			// 获取员工请假统计图数据
			get_list_employee_leave() {
				let data = {};
				let flag = false;
				let user_group = this.$store.state.user.user_group;
				let user_id = this.$store.state.user.user_id;
				if (user_group!='管理员'){
					if (user_group=="员工用户"){
						data.employee_job_number = user_id;
					}
				}
				this.$get("~/api/employee_leave/list_group?groupby=leave_type", data, (json) => {
					if (json.result) {
						var list = json.result.list;
						this.list_employee_leave = list.map((o) => {
							return {
								name: o[1],
								value: o[0]
							};
						});
						if (flag){
							this.get_nickname(this.list_employee_leave,false);
						}
					}
				});
			},
				getUserInfo(){
					let userGroup = window.localStorage.getItem('user_group');
						if(userGroup){
						let _userGroup =JSON.parse(userGroup);
						let _info = JSON.parse(_userGroup.value);
						this.isAdmin = _info["user_group"] == "管理员" ? true : false;
					}
			}

		},
		computed:{
			recognitionHeight(){
				if(this.recognitionType === "face"){
					return "1070px"
				}else{
					return "1180px"
				}
			},
			recognitionUrl(){
					if(this.recognitionType === "face"){
					return "https://www.sk-ai.com/Experience/face-compare"
				}else{
					return "https://www.sk-ai.com/Experience/recognition?type="
				}
			}
		}
	};
</script>

<style scoped="scoped">
	.chart {
		display: block;
		width: 100%;
		height: 400px;
		padding: 1rem;
		position: relative;
	}

	.el-col {
		padding: 0.5rem;
	}

	.card {
		overflow: hidden;
	}
	
	.iframe_box ,.iframe_box_change{
		width: 100%;
		height: 1180px;
		position: relative;
		margin-top: 25px;
	}
	.iframe_box_change{
		height: 580px;
		padding-top: 50px;
	}
.iframe_box	.iframe_box_content, .iframe_box_change .iframe_box_content{
	width: 100%;
	height: 100%;
}
.iframe_box_top{
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100px;
	font-size: 25px;
	line-height: 100px;
	background: #fff;
	z-index: 99999999;
	padding-left: 50px;
}
</style>
